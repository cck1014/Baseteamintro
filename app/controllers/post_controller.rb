class PostController < ApplicationController
	#before_action :authenticate_with_http_basic
	def index		#List Page      타이틀만 있는 곳
		@posts_index = Post.all.reverse		#	글 쓴 거 모두 불러오기
	end

	def	selectedPost	#게사판 제목 클릭하면 보이는 상세페이지
		#@post = Post.new					이거 주석 걸었는데 왜 id값이 받아지지?
		@selectedPost = Post.where(params[:id])
		@comment = Comment.all
		redirect_to "/selectedPost/#{@selectedPost.ids}"
		#@comments = Comment.where(:post_id => params[:post_id])	#	댓글 쓴 거 모두 불러오기	뭔가 이상한
		
	end

	def post			#글작성 폼태그Page
	end
	
	def create		#글 직접 쓰는 액션
		@post=Post.new
		@post.title = params[:title]
		@post.content = params[:content]
		@post.save
		redirect_to index_path
	end
	
	def delete
		Post.destroy(params[:post_id])			# 이걸 post =    아런 식으로 변수에 담아줘도 작동한다.
			redirect_to '/index'
	end

	def modify		#수정버튼 누르면 나오는 폼
		@post = Post.find(params[:post_id])
	end

	def update		#수정버튼 누르고 나온 폼에서 수정할 데이터 입력
		@post = Post.find(params[:post_id])
		@post.title = params[:title]
		@post.content = params[:content]
		@post.save										#수정은 create랑 똑같은게 많음
			redirect_to "/selectedPost/#{@post.id}"	#여기에 @ 했으면 위에도 post변수에도 @ 해줘야한다			
	end

	def	comments_create
		@comment = Comment.new
		@comment.post_id = params[:comment_id]
		@comment.content = params[:content]
		#@comment.author = params[:author]
			
		#Rails.logger.debug @comment.comment_id
		#puts @comment.post_id
		#Rails.logger.debug @comment.content
		@comment.save	
			redirect_to "/selectedPost/#{@comment.post_id}"		#	post_id를 잘 여겨보자
	end

	def	deleteComment
		@comment = Comment.new
		@comment = Comment.find(params[:comment_id])
		Comment.destroy(params[:comment_id])
		redirect_to "/selectedPost/#{@comment.post_id}"		#	 여기에 이거 쓰려면 위에다가 전부 @ 해줘야한다.
	end

	def updateComment
		#@comment = Comment.new
		
		@comment = Comment.where(params[:id])
		@comment.content = params[:content]
		@comment.save
		redirect_to "/selectedPost/#{@comment.post_id}"		
	end
	
	def	updateComment_form
		#@comment = Comment.new
		@comment = Comment.where(params[:id])		#여기가 왜 id로 하면 되고 comment_id로 하면 안되는지 모르겠음.   위에 delete는 comment_id만으로 되는데?
	end

end
