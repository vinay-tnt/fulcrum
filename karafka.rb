# frozen_string_literal: true

class KarafkaApp < Karafka::App
  setup do |config|
    if Rails.env.production?
      credentials = JSON.parse(ENV.fetch('RP_KAFKA_CREDS', nil))

      config.kafka = {
        'bootstrap.servers': ENV.fetch('RP_KARAFKA_BROKERS', nil),
        'security.protocol': 'SASL_SSL',
        'sasl.username': credentials['username'],
        'sasl.password': credentials['password'],
        'sasl.mechanisms': 'SCRAM-SHA-512'
      }
    else
      config.kafka = {
        'bootstrap.servers': '127.0.0.1:9092'
      }
    end

    config.client_id = "relativity_platform_#{Rails.env}"
    # Recreate consumers with each batch. This will allow Rails code reload to work in the
    # development mode. Otherwise Karafka process would not be aware of code changes
    config.consumer_persistence = !Rails.env.development?
  end

  # Comment out this part if you are not using instrumentation and/or you are not
  # interested in logging events for certain environments. Since instrumentation
  # notifications add extra boilerplate, if you want to achieve max performance,
  # listen to only what you really need for given environment.
  Karafka.monitor.subscribe(Karafka::Instrumentation::LoggerListener.new)
  # Karafka.monitor.subscribe(Karafka::Instrumentation::ProctitleListener.new)

  # This logger prints the producer development info using the Karafka logger.
  # It is similar to the consumer logger listener but producer oriented.
  Karafka.producer.monitor.subscribe(
    WaterDrop::Instrumentation::LoggerListener.new(Karafka.logger)
  )

  routes.draw do
    consumer_group :parsers do
      # Topic on which AOVX devices publish data
      topic :dtc_aovx_v1 do
        config(partitions: 10, replication_factor: 2)

        consumer V1::AovxConsumer
      end

      # Topic on which SSL300 devices publish data
      topic :dtc_v1 do
        config(partitions: 10, replication_factor: 2)

        consumer V1::DtcConsumer
      end

      topic :phone_v1 do
        config(partitions: 10, replication_factor: 2)

        consumer V1::PhoneConsumer
      end

      topic :ble_gw_v1_adv do
        config(partitions: 10, replication_factor: 2)

        consumer V1::BluetoothGatewayConsumer
      end
    end

    consumer_group :zebra_mcu do
      topic :zebra_mcu_v1_ack do
        config(partitions: 10, replication_factor: 2)
        consumer V1::Printers::AcknowledgementConsumer
      end

      topic :zebra_mcu_v1_response do
        config(partitions: 10, replication_factor: 2)
        consumer V1::Printers::ResponseConsumer
      end
    end

    consumer_group :database do
      topic :unified_payload do
        config(partitions: 10, replication_factor: 2)

        consumer DatabaseConsumer
      end
    end

    if Rails.env.production?
      consumer_group :storage do
        topic :unified_payload do
          config(partitions: 10, replication_factor: 2)

          consumer S3Consumer
        end
      end
    end

    consumer_group :shipment_alerts do
      topic :unified_payload do
        config(partitions: 10, replication_factor: 2)

        consumer V1::Alerts::ShipmentsConsumer
      end
    end

    consumer_group :asset_alerts do
      topic :unified_payload do
        config(partitions: 10, replication_factor: 2)

        consumer V1::Alerts::AssetsConsumer
      end
    end

    consumer_group :site_alerts do
      topic :unified_payload do
        config(partitions: 10, replication_factor: 2)

        consumer V1::Alerts::SitesConsumer
      end
    end

    consumer_group :device_alerts do
      topic :unified_payload do
        config(partitions: 10, replication_factor: 2)

        consumer V1::Alerts::DevicesConsumer
      end
    end

    consumer_group :shipment_asset_alerts do
      topic :unified_payload do
        config(partitions: 10, replication_factor: 2)

        consumer V1::Alerts::ShipmentAssetsConsumer
      end
    end

    consumer_group :site_asset_alerts do
      topic :unified_payload do
        config(partitions: 10, replication_factor: 2)

        consumer V1::Alerts::SiteAssetsConsumer
      end
    end

    consumer_group :fleet_alerts do
      topic :unified_payload do
        config(partitions: 10, replication_factor: 2)

        consumer V1::Alerts::FleetsConsumer
      end
    end

    consumer_group :rules do
      topic :unified_payload do
        config(partitions: 10, replication_factor: 2)

        consumer V1::Alerts::RulesConsumer
      end
    end

    consumer_group :trip_alerts do
      topic :unified_payload do
        config(partitions: 10, replication_factor: 2)

        consumer V1::Alerts::TripsConsumer
      end
    end
  end
end
