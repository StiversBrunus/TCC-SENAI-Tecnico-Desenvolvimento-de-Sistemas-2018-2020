import React from 'react'
import { Link } from 'react-router-dom'

export const BannerBotao = (props) => {

    const { idFotografo } = props

    return (
        <div >
            <nav style={{height:'20vh', backgroundColor:'#641682', paddingTop:'50px'}}>
                <div className="container">
                    <div className="row right">
                        <Link to={'/cliente/fotografos/' + idFotografo + '/contratacao'} className="waves-effect waves-light btn-large" style={{backgroundColor:'#008000', color:'#ffffff', letterSpacing:'1px' }}>Contratar</Link>
                    </div>
                </div>
            </nav>
        </div>
    )
} 

export const Navbar = () => {
    return (
        <div>
            <nav>
                <div className="container">
                    <div className="nav-wrapper">
                        <a href="#!" className="brand-logo">Logo</a>
                        <ul className="right hide-on-med-and-down">
                            {/* <li><a href="#"><i class="material-icons left">search</i>Suas contratações</a></li> */}
                            <li><Link to="/cliente/fotografos"><i className="material-icons left">arrow_back</i>Voltar para o início</Link></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    )
}
