import './App.css'
import {Header} from "./layout/Header";
import {Content} from "./layout/Content";
import {Footer} from "./layout/Footer";

/**
 * Root component of the application
 */
function App() {
  return <>
    <Header />
    <Content />
    <Footer />
  </>
}
export default App
