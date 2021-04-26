Rails.application.routes.draw do
  get 'mlb_player_search_api/mlb_player_search_api'
  	get 'home/home'
  	root :to => "teamintro#teamintro"
	
	
  scope 'baseball' do
	  get '/join' =>"teamintro#BaseballJoinPage"		#/baseball/join이 URL이 되고 화살표 옆이 컨트롤러 액션명이 된다.
	  get '/login' =>"teamintro#BaseballLoginPage"
  end
	post 'teamintro/BaseballJoin'#회원가입 처리하는 부분
	
	
get '/user/new' => 'user#new'   #회원가입 폼
post '/user/createUser' => 'user#createUser'
get '/user/index' => 'user#index'   # 데이터를 넘겨주고 다음 화면으로 넘기는 것도 get이다.
get '/loginform' => 'session#new'
post '/session/login' => 'session#login'
	get 'teamintro/firstpage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	
	
get '/index' => 'post#index'	#글 읽어오는
get '/selectedPost/:selectedPost_id' => 'post#selectedPost' #게시판 목록에 제목 클릭하면 해당 글의 상세페이지 이동
get '/post' => 'post#post'                 #insert할때 create부분과 post 두개가 필요하다는거 조심(create는 뷰 필요없음. 데이터만 컨트롤러 지나가주면 됨)
post '/create' => 'post#create'
get '/delete/:post_id' => 'post#delete'    #delete에 여기 URL부분과 뷰에 href id부분 , 컨트롤러에 id부분 조심
get '/modify/:post_id' => 'post#modify'        #수정하는 폼 작성
post '/update/:post_id' => 'post#update'
get '/comments_create_form' => 'post#comments_create_form'
post '/comments_create/:comment_id' => 'post#comments_create'
get '/deleteComment/:comment_id' => 'post#deleteComment'
post '/updateComment/:comment_id' => 'post#updateComment'
get '/updateComment_form' => 'post#updateComment_form'

end
