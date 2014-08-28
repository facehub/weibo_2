module WeiboOAuth2
  module Api
    module V2
      class Messages < Base
      
        #read interfaces
        def receive(uid, opt={})
          hashie get("messages/receive.json", params: {uid: uid}.merge(opt))
        end

        #write interfaces
        def reply(id, comment, opt={})
          data = "{\"text\":\"#{comment}\"}"
          hashie post("messages/reply.json", body: {type: "text", receiver_id: id, data: data}.merge(opt).to_query)
        end
               
      end
    end
  end
end