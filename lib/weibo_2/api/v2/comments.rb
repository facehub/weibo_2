module WeiboOAuth2
  module Api
    module V2
      class Comments < Base
      
        #read interfaces
        def show(id, opt={})
          hashie get("comments/show.json", :params => {:id => id}.merge(opt))
        end
        
        def by_me(opt={})
          hashie get("comments/by_me.json", :params => opt)
        end
        
        def to_me(opt={})
          hashie get("comments/to_me.json", :params => opt)
        end
        
        def timeline(opt={})
          hashie get("comments/timeline.json", :params => opt)
        end
        
        def mentions(opt={})
          hashie get("comments/mentions.json", :params => opt)
        end
        
        def show_batch(cids, opt={})
          hashie get("comments/show_batch.json", :params => {:cids => cids}.merge(opt))
        end
        
        #write interfaces
        def create(id, comment, opt={})
          hashie post("comments/create.json", :body => {:id => id, :comment => comment}.merge(opt))
        end
        
        def destroy(id, opt={})
          hashie post("comments/destroy.json", :body => {:id => id}.merge(opt))
        end
        
        def destroy_batch(ids, opt={})
          hashie post("comments/destroy_batch.json", :body => {:ids => ids}.merge(opt))
        end
        
        def reply(cid, id, comment, opt={})
          hashie post("comments/reply.json", :body => {:cid => cid, :id => id, :comment => comment}.merge(opt))
        end
               
      end
    end
  end
end