module SugarCRM; class Connection
  # Logs out of the Sugar user session.
  def logout
    login! unless logged_in?
    json = <<-EOF
      {
        "user_auth": {
          "session": "#{@sugar_session_id}"
        }
      }
    EOF
    json.gsub!(/^\s{6}/,'')
    send!(:logout, json)
  end
end; end