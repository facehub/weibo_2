module WeiboOAuth2
  module Api
    module V2
      class Friendships < Base
              
        #read interfaces
        def friends(uid, opt={})
          hashie get("friendships/friends.json", :params => {:uid => uid}.merge(opt))
        end
        
        def friends_ids(uid, opt={})
          hashie get("friendships/friends/ids.json", :params => {:uid => uid}.merge(opt))
        end
        
        def followers(uid, opt={})
          hashie get("friendships/followers.json", :params => {:uid => uid}.merge(opt))
        end
        
        def followers_ids(uid, opt={})
          hashie get("friendships/followers/ids.json", :params => {:uid => uid}.merge(opt))
        end

        def friends_in_common(uid, opt={})
          hashie get("friendships/friends/in_common.json", :params => {:uid => uid}.merge(opt))
        end
        
        def friends_bilateral(uid, opt={})
          hashie get("friendships/friends/bilateral.json", :params => {:uid => uid}.merge(opt))
        end
        
        def friends_bilateral_ids(uid, opt={})
          hashie get("friendships/friends/bilateral/ids.json", :params => {:uid => uid}.merge(opt))
        end
        
        def followers_active(uid, opt={})
          hashie get("friendships/followers/active.json", :params => {:uid => uid}.merge(opt))
        end
        
        def friends_chain_followers(uid, opt={})
          hashie get("friendships/friends_chain/followers.json", :params => {:uid => uid}.merge(opt))
        end
        
        def show(opt={})
          hashie get("friendships/show.json", :params => opt)
        end
        
        #write interfaces
        def create(screen_name, opt={})
          hashie post("friendships/create.json", :body => {:screen_name => screen_name}.merge(opt))
        end
        
        def destroy(screen_name, opt={})
          hashie post("friendships/destroy.json", :body => {:screen_name => screen_name}.merge(opt))
        end
        
      end
    end
  end
end
