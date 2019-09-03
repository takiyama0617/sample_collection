# frozen_string_literal: true

require 'mail'

def send_mail(params, mail)
  Mail.defaults do
    delivery_method :smtp, params
  end

  puts mail
  m = Mail.new do
    from mail[:from]
    to mail[:to]
    subject mail[:subject]
    body mail[:body]
  end

  m.charset
  m.deliver
end

params = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'gmail.com',
  user_name: 'GoogleアカウントID',
  password: 'Googleアカウントのパスワード'
}

mail = {
  from: 'from_hoge@example.com',
  to: 'to_hoge@example.com',
  subject: 'test_subject',
  body: 'test_body'
}

send_mail(params, mail)
