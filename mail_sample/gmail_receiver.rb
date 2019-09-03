# frozen_string_literal: true

require 'mail'

def get_mail(params)
  count = 0
  Mail.defaults do
    retriever_method :imap, params
  end
  begin
    mails = Mail.find(keys: 'UNSEEN', order: :desc)
    raise 'try again' if mails.empty?

    mails
  rescue StandardError => e
    sleep 3
    raise "メールを取得できなかった。 class = #{e.class}, message = #{e.message}" if (count += 1) == 10

    retry
  end
end

params = {
  address: 'imap.googlemail.com',
  user_name: 'Googleアカウント名',
  password: 'Googleアカウントのパスワード',
  port: 993,
  enable_ssl: true
}

mails = get_mail(params)

if mails.empty?
  puts 'There is no unread mail...'
else
  mail = mails.first
  puts "件名：#{mail.subject}"
  body = mail.multipart? ? mail.parts[0].body : mail.body
  puts body
end
