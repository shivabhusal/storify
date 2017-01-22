if Rails.env.development?
  # **Note**:We should use `mailcatcher` in development env to catch outgoing emails
  # Use following command to start mailcatcher server daemon
  # $ mailcatcher
  # Get out of project directory and try
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings   = { :address => 'localhost', :port => 1025 }

elsif !Rails.env.test?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings   = {
      :address              => ENV['SMTP_ADDRESS'],
      :port                 => ENV['SMTP_PORT'],
      :user_name            => ENV['SMTP_USERNAME'],
      :password             => ENV['SMTP_PASSWORD'],
      :authentication       => 'plain',
      :enable_starttls_auto => true
  }
end
