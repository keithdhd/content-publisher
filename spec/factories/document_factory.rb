# frozen_string_literal: true

FactoryBot.define do
  factory :document do
    content_id { SecureRandom.uuid }
    locale { I18n.available_locales.sample }
    base_path { "/#{SecureRandom.alphanumeric(8)}" }
    document_type { DocumentTypeSchema.all.reject(&:managed_elsewhere?).sample.document_type }

    trait :with_body do
      document_type { DocumentTypeSchema.all.select { |schema| schema.fields.any? { |field| field.id == "body" } }.sample.document_type }
    end
  end
end
