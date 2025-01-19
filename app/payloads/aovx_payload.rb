class AovxPayload
  include StoreModel::Model

  attribute :data, :string
  attribute :device_identifier, :string
  attribute :iot_core_received_at, :big_integer
  attribute :iot_core_source_topic, :string

  validates :data, :device_identifier, :iot_core_received_at, :iot_core_source_topic, presence: true
end
