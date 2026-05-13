import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
// Define the the application environment
const NODE_ENV = process.env.NODE_ENV?.toLowerCase() || 'production';

// Define the port number the server will listen on
const PORT = process.env.PORT || 3000;

const app = express();

//set engine 
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'src/views'));  //directs the server to where the ejs templates are located.
// Serve static files from the public directory
app.use(express.static(path.join(__dirname, 'public')));

/**
  * Routes
  */
app.get('/', (req, res) => {
    const title = 'Home';
    res.render( 'home' , {title})
});

app.get('/organizations', (req, res) => {
    const title = 'Organizations';
    res.render( 'organizations' , {title})
});

app.get('/categories', (req, res) => {
    const title = 'Categories';
    res.render ('categories' , {title})
})

app.get('/projects', (req, res) => {
    const title = 'Projects';
    res.render( 'projects' , {title})
});


app.listen(PORT, (()=>{
    console.log(`Server running at http://127.0.0.1:${PORT}`);
    console.log(`Environment: ${NODE_ENV}`);
}))