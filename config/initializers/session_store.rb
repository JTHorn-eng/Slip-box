Rails.application.config.session_store :active_record_store, key: (Rails.env.production? ? '_template_session_id' : (Rails.env.demo? ? '_template_demo_session_id' : '_template_dev_session_id')),
                                                             secure: (Rails.env.demo? || Rails.env.production?),
                                                             httponly: true
