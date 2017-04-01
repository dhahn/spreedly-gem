module Spreedly

  class OffsitePurchase < AuthPurchase
    
    field :checkout_url

    def initialize(xml_doc)
      super
      @response = SetupResponse.new(xml_doc)
    end

    def pending?
      state == 'pending'
    end

  end

  class SetupResponse
    include Fields

    field :success, type: :boolean
    field :created_at, :updated_at, type: :date_time
    field :message, :error_code, :checkout_url
    field :first_name, :last_name
    field :payer
    field :street1
    field :city_name
    field :state_or_province
    field :postal_code
    field :country
    

    def initialize(xml_doc)
      initialize_fields(xml_doc)
    end

  end

end
