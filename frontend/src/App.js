import './App.css';
import Navbar from './components/navbar/Navbar'
import Main from './components/main/Main'
import StoreContext from './store/configureStore'
import { Provider } from 'react-redux'
import { BrowserRouter as Router, Route } from 'react-router-dom';
import Login from './components/user/login/Login'
import Signup from './components/user/signup/Signup'

const store = StoreContext()
function App() {
    return (
      <Provider store={store}>
        <Router>
            <>
                <Navbar/>
                <Route exact path="/" component={Main}/>
                <Route exact path="/login" component={Login}/>
                <Route exact path="/signup" component={Signup}/>
            </>
        </Router>
      </Provider>
    
  );
}

export default App;
