# frozen_string_literal: true

module Api
  module V1
    class DnsRecordsController < ApplicationController
      before_action :required_pagination, only: :index

      # GET /dns_records
      def index
        @hostnames = paginate Hostname
                                .select("hostname, dns_record_id, COUNT(*) over (partition by hostname)")
                                .exclude_host(params[:excluded])
                                .include_host(params[:included])
                                .group(:id, :hostname)
                                .order(:id)

        records = @hostnames.order(:dns_record_id).map { |record| { id: record.dns_record_id, ip_address: record.dns_record.ip } }.uniq
        related_hostnames = @hostnames.map { |record| { count: record.count, hostname: record.hostname } }.uniq
        render json: { total_records: @hostnames.size, records: records, related_hostnames: related_hostnames }
      end

      # POST /dns_records
      def create
        @dns_record = DnsRecord.new(create_params)
        if @dns_record.save
          render json: @dns_record, include: [:hostnames], status: :created
        else
          render json: @dns_record.errors, status: :unprocessable_entity
        end
      end

      protected

      def create_params
        params.require(:dns_records).permit(:ip, hostnames_attributes: [:hostname])
      end

      def required_pagination
        render json: {}, status: :unprocessable_entity if params[:page].blank?
      end
    end
  end
end
