# frozen_string_literal: true

RSpec.describe ContentValidator do
  describe "title validation" do
    it "raises issue if the title is not set" do
      document = build(:document, title: nil)
      messages = ContentValidator.new(document).validation_messages
      expect(messages).to include(I18n.t("validations.title", min_length: 10))
    end

    it "raises issue if the title is too short" do
      document = build(:document, title: "Too short")
      messages = ContentValidator.new(document).validation_messages
      expect(messages).to include(I18n.t("validations.title", min_length: 10))
    end

    it "does not raise an issue if the title is fine" do
      document = build(:document, title: "Just long enough to validate.")
      messages = ContentValidator.new(document).validation_messages
      expect(messages).to_not include(I18n.t("validations.title", min_length: 10))
    end
  end

  describe "summary validation" do
    it "raises issue if the summary is not set" do
      document = build(:document, summary: nil)
      messages = ContentValidator.new(document).validation_messages
      expect(messages).to include(I18n.t("validations.summary", min_length: 10))
    end

    it "raises issue if the summary is too short" do
      document = build(:document, summary: "Too short")
      messages = ContentValidator.new(document).validation_messages
      expect(messages).to include(I18n.t("validations.summary", min_length: 10))
    end

    it "does not raise an issue if the summary is fine" do
      document = build(:document, summary: "Just long enough to validate.")
      messages = ContentValidator.new(document).validation_messages
      expect(messages).to_not include(I18n.t("validations.summary", min_length: 10))
    end
  end

  describe "min_length validation" do
    let(:body_field_schema) { build(:field_schema, id: "body", label: "Body", validations: { "min_length" => 10 }) }
    let(:document_type_schema) { build(:document_type_schema, contents: [body_field_schema]) }

    it "raises issue if the field is not set" do
      document = build(:document, document_type: document_type_schema.id)
      messages = ContentValidator.new(document).validation_messages
      expect(messages).to include(I18n.t("validations.min_length", field: "Body", min_length: 10))
    end

    it "raises issue if the field is too short" do
      document = build(:document, document_type: document_type_schema.id, contents: { body: "Too short" })
      messages = ContentValidator.new(document).validation_messages
      expect(messages).to include(I18n.t("validations.min_length", field: "Body", min_length: 10))
    end

    it "does not raise an issue if the field is fine" do
      document = build(:document, document_type: document_type_schema.id, contents: { body: "Just long enough to validate." })
      messages = ContentValidator.new(document).validation_messages
      expect(messages).to_not include(I18n.t("validations.min_length", field: "Body", min_length: 10))
    end
  end
end
