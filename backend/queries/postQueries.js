const db = require("../db/index");

const getAllPosts = async (req, res, next) => {
  try {
    res.status(200).json({
      status: "Success",
      message: "Got all Posts",
      body: {
        posts: await db.any(
          "SELECT posts.id, owner_id, post_image_url, body, timestamp, username, full_name, profile_pic_url   FROM posts INNER JOIN users ON posts.owner_id = users.id ORDER BY posts.id DESC"
        )
      }
    });
  } catch (error) {
    next(error);
  }
};

const getAllPostsBySingleUser = async (req, res, next) => {
  try {
    res.status(200).json({
      status: "Success",
      message: "Got all posts by user id: " + req.params.owner_id,
      body: {
        posts: await db.any(
          "SELECT owner_id, post_image_url, body FROM posts INNER JOIN users ON posts.owner_id = users.id WHERE posts.owner_id = $1 ORDER BY posts.id DESC",
          req.params.owner_id
        )
      }
    });
  } catch (error) {}
};

const getSinglePost = async (req, res, next) => {
  try {
    let { id } = req.params;
    res.status(200).json({
      status: "Success",
      message: "Got single post by id: " + id,
      body: {
        single_post: await db.any("SELECT * FROM posts WHERE id = $1", [id])
      }
    });
  } catch (error) {
    next(error);
  }
};

const insertSinglePost = async (req, res, next) => {
  try {
    let { owner_id, post_image_url, body } = req.body;
    let single_post = await db.one(
      "INSERT INTO posts (owner_id, post_image_url, body) VALUES ($1, $2, $3) RETURNING *",
      [owner_id, post_image_url, body]
    );
    res.status(200).json({
      status: "Success",
      message: "Created a single post",
      body: { single_post }
    });
  } catch (error) {
    next(error);
  }
};

const updateSinglePost = async (req, res, next) => {
  try {
    let { owner_id, post_image_url, body } = req.body;
    let { id } = req.params;
    let single_post = await db.one(
      "UPDATE posts SET owner_id=$1, post_image_url=$2, body=$3 WHERE id = $4 RETURNING *",
      [owner_id, post_image_url, body, id]
    );
    res.status(200).json({
      status: "Success",
      message: "Updated a single post",
      body: { single_post }
    });
  } catch (error) {
    next(error);
  }
};

const deletePost = async (req, res, next) => {
  try {
    let { id } = req.params;
    let single_post = await db.one(
      "DELETE FROM posts WHERE id = $1 RETURNING *",
      id
    );
    res.status(200).json({
      status: "Success",
      message: "Deleted post with id: " + id,
      body: {
        single_post
      }
    });
  } catch (error) {
    next(error);
  }
};

module.exports = {
  getAllPosts,
  getAllPostsBySingleUser,
  getSinglePost,
  insertSinglePost,
  updateSinglePost,
  deletePost
};
