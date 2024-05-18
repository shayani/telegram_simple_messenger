# frozen_string_literal: true

RSpec.describe TelegramSimpleMessenger do
  subject(:service) { described_class.send_message("Hello world!", api_key, chat_id) }

  let(:api_key) { "123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11" }
  let(:chat_id) { "123456789" }

  it "has a version number" do
    expect(TelegramSimpleMessenger::VERSION).not_to be nil
  end

  it "calls the Telegram API" do
    expect(HTTParty).to receive(:post).and_return(double(success?: true))
    service
  end

  context "when the API KEY is missing" do
    let(:api_key) { nil }

    it "returns an error message" do
      expect(service).to eq("API key and chat ID are required")
    end
  end

  context "when the CHAT ID is missing" do
    let(:chat_id) { nil }

    it "returns an error message" do
      expect(service).to eq("API key and chat ID are required")
    end
  end
end
