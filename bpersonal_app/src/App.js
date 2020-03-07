import React from "react";
import Login from "./components/LoginPage/Login";
import NavBar from "./components/NavBar";
import Profile from "./components/ProfilePage/Profile"
import Feed from "./components/FeedPage/Feed";
import { Route, Switch } from "react-router-dom";

function App() {
  return (
    <div className="App">
      <NavBar />
      <Switch>
      <Login />
        <Route path={"/feedpage"}>
          <Feed />
        </Route>
        <Route path={"/profilepage"}>
        <Profile />
        </Route>
      </Switch>
    </div>
  );
}

export default App;
