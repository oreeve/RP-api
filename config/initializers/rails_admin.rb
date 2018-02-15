RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  config.authorize_with do
    authenticate_or_request_with_http_basic('Login required') do |username, password|
      user = User.where(username: username, password: password, admin: true).first
      user
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model Property do
    list do
      field :street_address
      field :neighborhood
      field :description
      field :beds
      field :baths
      field :home_size
      field :lot_size
      field :type_of do
        label "Property Type"
      end
      field :status
      field :images
    end

    edit do
      field :street_address do
        required true
      end
      field :city do
        required true
      end
      field :state do
        required true
      end
      field :zip do
        required true
      end
      field :neighborhood
      field :description
      field :beds
      field :baths
      field :home_size
      field :lot_size
      field :type_of  do
        label "Property Type"
        help "Required - House, condo, etc."
      end
      field :status
      field :images
    end
  end

  config.model Image do
    list do
      field :property do
        pretty_value do
          property_id = bindings[:object].property_id
          address = value.try(:street_address)
          bindings[:view].link_to "#{address}", bindings[:view].rails_admin.show_path('property', property_id)
        end
      end
      field :title
      field :url
      field :description
    end

    show do
      field :property do
        pretty_value do
          property_id = bindings[:object].property_id
          address = value.try(:street_address)
          bindings[:view].link_to "#{address}", bindings[:view].rails_admin.show_path('property', property_id)
        end
      end
      field :title
      field :url
      field :description
    end

    edit do
      field :property_id, :enum do
        enum do
          Property.all.collect { |p| [p.street_address, p.id] }
        end
        required true
      end
      field :title
      field :url
      field :description
    end
  end
end
