class SandboxEmailInterceptor
  def self.delivering_email(message)
    message.to = ['nussu.logistics.dev@gmail.com']
  end
end