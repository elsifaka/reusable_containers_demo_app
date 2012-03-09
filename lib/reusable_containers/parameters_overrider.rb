module ReusableContainers
  class ParametersOverrider
    def initialize(app)
      @app = app
    end

    def call(env)
      Rails.logger.debug "ORIGINAL_FULLPATH: #{env["ORIGINAL_FULLPATH"]}"
      Rails.logger.debug "PATH_INFO: #{env["PATH_INFO"]}"
      Rails.logger.debug "QUERY_STRING: #{env["QUERY_STRING"]}"
      Rails.logger.debug "REQUEST_URI: #{env["REQUEST_URI"]}"
      Rails.logger.debug "REQUEST_PATH: #{env["REQUEST_PATH"]}"
      new_request = ""
      entry = nil
      begin
        entry = Entry.find_by_permalink(env["PATH_INFO"])
      rescue Exception => exception
        Rails.logger.error exception
      end
      env["public"] = !!entry
      if entry
        Rails.logger.debug entry.name
        #Rails.logger.debug ActionController::Integration::Session.new(@app).url_for(e.destination_as_params)
        Rails.logger.debug entry.destination_path
        new_request = entry.destination_path

        original_query_strings = env["QUERY_STRING"].to_s.split("&")
        path_info, local_query_string = new_request.split("?")
        new_query_strings = (local_query_string.to_s.split("&") + original_query_strings).uniq
        query_string = new_query_strings.join("&")
        new_request = [path_info, query_string].join("?")
        env["ORIGINAL_FULLPATH"] = new_request
        env["PATH_INFO"] = path_info
        env["QUERY_STRING"] = query_string
        env["REQUEST_URI"] = new_request
        env["REQUEST_PATH"] = path_info
        #Rails.logger.debug "params: #{env["action_dispatch.request.parameters"].inspect}"
        #Rails.logger.debug env.keys.sort.inspect
        #env["action_dispatch.request.parameters"] = env["action_dispatch.request.parameters"].merge(e.destination_as_params)
        env["current_entry"] = entry
        env["current_container"] = entry.container
        env.each do |k, v|
          Rails.logger.debug k.to_s + ": " + v.to_s
        end
      end

      #Rails.logger.debug "APP: #{@app.class.to_s}"
      #Rails.logger.debug @app.methods.sort.inspect
      #Rails.logger.debug @app.url_helpers.methods.sort.inspect
      @app.call(env)
    end
  end
end
