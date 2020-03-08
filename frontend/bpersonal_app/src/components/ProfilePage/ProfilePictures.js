import React, { useState, useEffect } from "react";
import DisplayFeedImages from './DisplayFeedImages'
import axios from 'axios'

const ProfilePictures = () => {
  // const [ userId, setUserID ] = useState("")
  const [ images, setImgs ] = useState([])

  const fetchImgs = async (url) => {
    try {
      let res = await axios.get(url) 
      // debugger
      const { posts } = res.data.body
      // debugger
      setImgs(posts)
      
    } catch (error) {
      setImgs([])    
    }
  }
  
  useEffect(() => {
    fetchImgs("http://localhost:3001/posts/ownerID/3")
  }, [])
  
  const showImages = images.map((img, i) => {
    
    console.log(img)
    return (
      <DisplayFeedImages img={img.post_image_url} key={i}/>
      )
    })
    // debugger
    
    return (
      <div>
    {showImages}
    </div>
  )
}

export default ProfilePictures;