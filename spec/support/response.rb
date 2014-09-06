class ActionController::TestResponse
  def json
    j = JSON.parse body
    if j.is_a? Hash
      Hashie::Mash.new j
    else
      j.map { |o| Hashie::Mash.new o }
    end
  end
end
