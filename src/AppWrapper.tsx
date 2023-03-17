import React, { createContext, useContext } from "react";
import App from "./App";
import { DataContext, useData, useMenus } from "./data/hooks";


const AppWrapper = () => {
    const data = useData()
    return (
        <DataContext.Provider value={data}>
            <App />
        </DataContext.Provider>
    );
};

export default AppWrapper;


const App2 = () => {
    const data = useContext(DataContext)
    console.log(data)
    const menus = useMenus()
    console.log({menus})
    return (
        <div>
            <h1>Netacad2</h1>
        </div>
    );
};