import Head from "next/head";
import Image from "next/image";

import freemint from './freemint';
import presale from './presale';
import { BrowserRouter as Router, Route, Link, Switch } from 'react-router-dom';

import Header from "../components/Header";
import Hero from "../components/Hero";

export default function Home() {
  return (
    <div className="min-h-screen w-full bg-primary">
      <Header />
      <Hero />
    </div>
  );
  <Router>
  
      <Link to="/freemint"></Link>
      <Link to="/presale"></Link>

      <Switch>
        <Route path="/freemint" component={freemint}/>
        <Route path="/presale" component={presale}/>
      </Switch>

</Router>
}





