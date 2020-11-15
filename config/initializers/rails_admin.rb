RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :admin
   end
   config.current_user_method(&:current_admin)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

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
  

   
  # RailsAdmin.config do |config|
  #   config.model 'Chofer' do
  #     object_label_method do
  #       :custom_label_method
  #     end
  #   end
  #   Chofer.class_eval do
  #     def custom_label_method
  #       "Chofer #{self.name}"
  #     end
  #   end
  # end

  RailsAdmin.config do |config|
    config.model 'Camino' do
      object_label_method do
        :custom_label_method
      end
    end
  end
  
  RailsAdmin.config do |config|
     config.model 'Chofer' do
       object_label_method do
           :custom_label_method
        end
      end
  end

  RailsAdmin.config do |config|
    config.model 'Combi' do
      object_label_method do
          :custom_label_method
       end
     end
 end

 RailsAdmin.config do |config|
  config.model 'Lugar' do
    object_label_method do
        :custom_label_method
     end
   end
end

RailsAdmin.config do |config|
  config.model 'Insumo' do
    object_label_method do
        :custom_label_method
     end
   end
end

RailsAdmin.config do |config|
  config.model 'User' do
    object_label_method do
        :custom_label_method
     end
   end
end

RailsAdmin.config do |config|
  config.model 'Viaje' do
    object_label_method do
        :custom_label_method
     end
   end
end
   
end
