require 'oauth2'

module WeiboOAuth2
  class Client < OAuth2::Client

    API_SITE = 'https://api.weibo.com/2/'
    MESSAGE_API_SITE = 'https://m.api.weibo.com/2/'

    attr_accessor :access_token
    
    def initialize(client_id='', client_secret='', opts={}, &block)
      client_id = WeiboOAuth2::Config.api_key if client_id.empty?
      client_secret = WeiboOAuth2::Config.api_secret if client_secret.empty?
      super
      @site = API_SITE
      @options[:authorize_url] = '/oauth2/authorize'
      @options[:token_url] = '/oauth2/access_token'
    end

    def self.from_code(code, opts={}, &block)
      client = self.new(opts, &block)
      client.auth_code.get_token(code)

      client
    end

    def self.from_hash(hash, opts={}, &block)
      client = self.new(opts, &block)
      client.get_token_from_hash(hash)

      client
    end    

    def authorize_url(params={})
      params[:client_id] = @id unless params[:client_id]
      params[:response_type] = 'code' unless params[:response_type]
      params[:redirect_uri] = WeiboOAuth2::Config.redirect_uri unless params[:redirect_uri]
      super
    end
    
    def get_token(params, access_token_opts={})
      params = params.merge({:parse => :json})
      access_token_opts = access_token_opts.merge({:header_format => "OAuth2 %s", :param_name => "access_token"})
      super
    end
    
    def get_and_restore_token(params, access_token_opts={})
      @access_token = get_token(params, access_token_opts={})
    end
    
    def get_token_from_hash(hash)
      access_token = hash.delete(:access_token) || hash.delete('access_token')
      @access_token = WeiboOAuth2::AccessToken.new( self, access_token, hash.merge(:header_format => 'OAuth2 %s', :param_name => 'access_token') )
    end
    
    def authorized?
      @access_token && @access_token.validated?
    end
    
    def users
      self.site = API_SITE
      @users ||= WeiboOAuth2::Api::V2::Users.new(@access_token) if @access_token
    end
    
    def statuses
      self.site = API_SITE
      @statues ||= WeiboOAuth2::Api::V2::Statuses.new(@access_token) if @access_token
    end
    
    def comments
      self.site = API_SITE
      @comments ||= WeiboOAuth2::Api::V2::Comments.new(@access_token) if @access_token
    end
    
    def friendships
      self.site = API_SITE
      @friendships ||= WeiboOAuth2::Api::V2::Friendships.new(@access_token) if @access_token
    end
    
    def account
      self.site = API_SITE
      @account ||= WeiboOAuth2::Api::V2::Account.new(@access_token) if @access_token      
    end
    
    def favorites
      self.site = API_SITE
      @favorites ||= WeiboOAuth2::Api::V2::Favorites.new(@access_token) if @access_token      
    end
    
    def trends
      self.site = API_SITE
      @trends ||= WeiboOAuth2::Api::V2::Trends.new(@access_token) if @access_token      
    end
    
    def tags
      self.site = API_SITE
      @tags ||= WeiboOAuth2::Api::V2::Tags.new(@access_token) if @access_token      
    end
    
    def register
      self.site = API_SITE
      @register ||= WeiboOAuth2::Api::V2::Register.new(@access_token) if @access_token      
    end
    
    def search
      self.site = API_SITE
      @search ||= WeiboOAuth2::Api::V2::Search.new(@access_token) if @access_token      
    end
    
    def short_url
      self.site = API_SITE
      @short_url ||= WeiboOAuth2::Api::V2::ShortUrl.new(@access_token) if @access_token      
    end
    
    def suggestions
      self.site = API_SITE
      @suggestions ||= WeiboOAuth2::Api::V2::Suggestions.new(@access_token) if @access_token      
    end
    
    def remind
      self.site = API_SITE
      @remind ||= WeiboOAuth2::Api::V2::Remind.new(@access_token) if @access_token      
    end
    
    def auth_code
      self.site = API_SITE
      @auth_code ||= WeiboOAuth2::Strategy::AuthCode.new(self)
    end

    def place
      self.site = API_SITE
      @place ||= WeiboOAuth2::Api::V2::Place.new(@access_token) if @access_token
    end

    def location
      self.site = API_SITE
      @location ||= WeiboOAuth2::Api::V2::Location.new(@access_token) if @access_token
    end

    def direct_messages
      self.site = API_SITE
      @direct_messages ||= WeiboOAuth2::Api::V2::DirectMessages.new(@access_token) if @access_token
    end

    def messages
      self.site = MESSAGE_API_SITE
      @messages ||= WeiboOAuth2::Api::V2::Messages.new(@access_token) if @access_token
    end
    
  end 
end
