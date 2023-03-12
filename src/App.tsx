import { useState } from 'react'
import reactLogo from './assets/react.svg'
import './App.css'
import { Status, useDashboardElements, useMenus, useNews, usePages, useSliderElements, useStatus, useError } from './data/hooks'

function App() {
  const menus = useMenus()
  const pages = usePages()
  const news = useNews()
  const status = useStatus()
  const error = useError()
  const sliderElements = useSliderElements()
  const dashboardElements = useDashboardElements()
  const [activeMenu, setActiveMenu] = useState(0)

  console.log({menus, pages, news, sliderElements, dashboardElements})

  if (error) return (
    <>
      <h1>Opsz, valami hiba történt!</h1>
      <p>{JSON.stringify(error)}</p>
    </>
  ) 

  if (status === Status.connecting) return (
    <h1>Az oldal töltődik</h1>
  ) 

  return (
    <div className="App">
      
      <ul className="menu">
        {menus && menus.map((menu) => (
          <>
            <li key={menu.id} className="item" onClick={() => {}}>{menu.title}</li>

            {menu.submenu.length>0 && (
            <ul className="submenu">
              {menu.submenu.map((submenu) => (
                <li key={submenu.id}>{submenu.title}</li>
              ))}
            </ul>
            )}
          </>
        ))}


      </ul>
      <h1>Netacad.hu</h1>
      <h2>Hírek</h2>
      {news && news.map((news) => (
        <div key={news.id}>
          <h3>{news.title}</h3>
          <h4>{news.title}</h4>
          {news.headlineIsNotDisplaying && (
            <div dangerouslySetInnerHTML={{ __html: news.headlineLong }} />
          )}
          <div dangerouslySetInnerHTML={{ __html: news.content }} />
        </div>
      ))}

    </div>
  )
}

export default App
