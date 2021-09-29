module Api
  module V1
    class DnsRecordsController < ApplicationController
      # GET /dns_records
      def index
        @dns_records = DnsRecord.all
        render json: @dns_records
      end

      # POST /dns_records
      def create
        @dns_record = DnsRecord.new(create_params)
        if @dns_record.save
          render json: @dns_record, status: :created
        else
          render json: @dns_record.errors, status: :unprocessable_entity
        end
      end

      protected

      def create_params
        params.require[:dns_records].permit(:ip)
      end
    end
  end
end
