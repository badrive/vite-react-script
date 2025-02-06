#!/bin/bash

echo -n "
 ██▀███  ▓█████ ▄▄▄       ▄████▄  ▄▄▄█████▓
▓██ ▒ ██▒▓█   ▀▒████▄    ▒██▀ ▀█  ▓  ██▒ ▓▒
▓██ ░▄█ ▒▒███  ▒██  ▀█▄  ▒▓█    ▄ ▒ ▓██░ ▒░
▒██▀▀█▄  ▒▓█  ▄░██▄▄▄▄██ ▒▓▓▄ ▄██▒░ ▓██▓ ░ 
░██▓ ▒██▒░▒████▒▓█   ▓██▒▒ ▓███▀ ░  ▒██▒ ░ 
░ ▒▓ ░▒▓░░░ ▒░ ░▒▒   ▓▒█░░ ░▒ ▒  ░  ▒ ░░   
  ░▒ ░ ▒░ ░ ░  ░ ▒   ▒▒ ░  ░  ▒       ░    
  ░░   ░    ░    ░   ▒   ░          ░      
   ░        ░  ░     ░  ░░ ░               
                         ░                 
   
Folder name :"

read folder
npm create vite@latest $folder -- --template react
cd $folder
rm -rf .git public/* src/*

echo "<!DOCTYPE html>
<html lang='en'>
    <head>
    <meta charset='utf-8' />
    <meta name='viewport' content='width=device-width, initial-scale=1' />
    <meta name='theme-color' content='#000000' />
    <meta
        name='description'
        content='Web site created using create-react-app'
    />
    <title>React App</title>
    </head>
    <body>
    <div id='root'></div>
    <script type="module" src="/src/index.jsx"></script>
    </body>
</html>" > ./index.html

touch ./src/index.jsx
mkdir -p ./src/assets/{img,videos}
mkdir -p ./src/{layouts,utils,pages/Home/components}
touch ./src/layouts/{header.jsx,footer.jsx}
touch ./src/pages/Home/home.jsx
touch ./src/pages/Home/components/{firstSection.jsx,firstSection.scss}

echo "import './firstSection.scss'
export const FirstSection = () => {
    return (
        <>
        <h1>Hello World!</h1>
        </>
    );
}" > ./src/pages/Home/components/firstSection.jsx

echo "import { FirstSection } from './components/firstSection';
export const HomePage = () => {
    return (
        <>
            <FirstSection/>
        </>
    );
}" > ./src/pages/Home/home.jsx

echo "import { HomePage } from './pages/Home/home';
function App() {
  return (
    <HomePage/>
  );
}
export default App;" > ./src/App.jsx

echo "import React from 'react';
import './index.css'
import ReactDOM from 'react-dom/client';
import App from './App';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);" > ./src/index.jsx

npm install sass
npm install react-icons --save
npm install tailwindcss @tailwindcss/vite
npm i react-router-dom
npm i --save @fortawesome/fontawesome-free

echo '@import "tailwindcss";' > ./src/index.css

echo 'import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
  ],
})' > ./vite.config.js


echo '@import "tailwindcss";' > ./src/index.css
