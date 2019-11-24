class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:user)
  end
  #includesメソッドでpostを呼ぶ度にuser.idも取得するというメソッド
  
  def new
    @post = Post.new
  end
  #newは新規投稿ページを表示するリクエストに対応して動く

  def create
    Post.create(post_params)
    redirect_to root_path
  end
  #createはテーブルにレコードを追加してくれる

  def show
  @post = Post.find(params[:id])
  end
  #showアクションは params:idを生成してくれる！
  #findはテーブルのレコードの内、ある1つのデータを取得する

   def edit
  @post = Post.find(params[:id])
   end
   #idで編集するブログの情報を@post変数に入れている

   def update
  post=Post.find(params[:id])
  post.update(post_params)
  redirect_to post_path(post.id)
   end

   #まずfindで更新したいブログを取得し
   #updateでそれを更新してトップページに戻る
   #post変数には、今、更新した記事が入る

   def destroy
  post = Post.find(params[:id])
  post.destroy
  redirect_to root_path
  end

   private
   def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)  
    end
# requireとpermitはform_withを開ける鍵の役割
# params.permit(:キー名, :キー名) で受け取りたいキーを指定する
# mergeメソッドを利用して、postというハッシュの中に、user_idというキーを結合して user_idをpostsテーブルに登録できるようにする
#ログイン中のユーザーidが必要なため、current_user.idと記述することで取得が可能
end
