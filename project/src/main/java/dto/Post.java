package dto;


public class Post{
	private String postID;
	private String userId;
	private String postTitle;
	private String postContent;
	
	public Post() {
		super();
	}
	
	public Post(String postId, String userId, String postTitle, String postContent) {
		this.postID = postId;
		this.userId = userId;
		this.postTitle = postTitle;
		this.postContent = postContent;
	}

	public String getPostID() {
		return postID;
	}

	public void setPostID(String postID) {
		this.postID = postID;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
}