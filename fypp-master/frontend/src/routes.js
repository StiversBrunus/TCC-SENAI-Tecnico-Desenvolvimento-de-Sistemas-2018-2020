import React from 'react'
import {BrowserRouter, Switch, Route} from 'react-router-dom';
// import {browserHistory} from "react-router"

import LoginCliente from './componentes/login/cliente/ContainerLoginCliente'
import LoginFotografo from './componentes/login/fotografo/ContainerLoginFotografo'

import RotasCadastroFotografo from './componentes/cadastro/fotografo/CadastroFotografo'
import RotasCadastroCliente from './componentes/cadastro/cliente/CadastroCliente'
// import FotografoCategorias from '../src/componentes/cadastro/fotografo/CadastroCategorias'
import Index from '../src/componentes/home/Index'

import TrabalhosFotografo from './componentes/areaFotografo/trabalhos/Trabalhos'
import PortfolioFotogrado from './componentes/areaFotografo/portfolio/Portfolio'
import CriarPortfolio from './componentes/areaFotografo/portfolio/portfolio/CriarPorftolio'
import UploadPortfolio from './componentes/areaFotografo/portfolio/upload/ContainerUpload'
import PacotesFotografo from './componentes/areaFotografo/pacotes/Pacotes'
import NovoPacoteFotografo from './componentes/areaFotografo/pacotes/novoPacote/CriarPacote'

import CategoriaCliente from '../src/componentes/areaCliente/categoria/ContainerCategoria'
import FotografosCliente from '../src/componentes/areaCliente/fotografo/listargemFotografos/ContainerFotografos'
import PerfilFotografoCliente from '../src/componentes/areaCliente/fotografo/perfilFotografo/ContainerPerfilFotografo'
import SelecaoDataHora from './componentes/areaCliente/categoria/selecaoData/FiltroDataHora'
import DadosEventoContratacao from './componentes/areaCliente/fotografo/contratacaoFotografo/ContainerDadosContratacao'

// import DadosEventoContratacao from './componentes/areaCliente/fotografo/contratacaoFotografo/dadosEvento/ContainerDadosEvento'

// import CartaoCreditoContratacao from './componentes/areaCliente/fotografo/contratacaoFotografo/CartaoCredito'
import Loading from './componentes/loading/LoadingFullScreen'
// import FrmConfirmDados from  './componentes/areaCliente/fotografo/contratacaoFotografo/confirmaDados/FormConfirmarDados'

// import PaymentForm from './componentes/areaCliente/fotografo/contratacaoFotografo/dadosCartão/PaymentForm'

const Routes = () => (
    <BrowserRouter>
        <Switch>
            {/*ROTAS BASICAS*/}
            <Route exact path='/' component={Index}/>
            <Route exact path='/fotografo/cadastro' component={RotasCadastroFotografo}/>
            <Route exact path='/cliente/cadastro' component={RotasCadastroCliente}/>
            <Route exact path='/fotografo/login' component={LoginFotografo}/>
            <Route exact path='/cliente/login' component={LoginCliente}/>

            {/*ROTAS CMS FOTOGRAFO*/}
            <Route exact path='/fotografo/trabalhos' component={TrabalhosFotografo}/>
            <Route exact path='/fotografo/portfolio' component={PortfolioFotogrado}/>
            <Route exact path='/fotografo/portfolio/nome/:idPortfolio/fotos' component={UploadPortfolio}/>
            <Route exact path='/fotografo/portfolio/nome' component={CriarPortfolio}/>
            <Route exact path='/fotografo/pacotes' component={PacotesFotografo}/>
            <Route exact path='/fotografo/pacotes/novo' component={NovoPacoteFotografo}/>

            {/*ROTAS CMS CLIENTE*/}
            <Route exact path='/cliente/categorias' component={CategoriaCliente}/>
            <Route exact path='/cliente/fotografos' component={FotografosCliente}/>
            <Route exact path='/cliente/fotografos/:idFotografo' component={PerfilFotografoCliente}/>
            <Route exact path='/cliente/categorias/:idCategoria/data' component={SelecaoDataHora} />
            <Route exact path='/cliente/fotografos/:idFotografo/contratacao/' component={DadosEventoContratacao}/>
           
           
            {/* ROTA TESTES */}
            {/* <Route exact path='/cliente/credito' component={PaymentForm} /> */}
            <Route exact path='/cliente/loading' component={Loading} />
            {/* <Route exact path='/dados' component={FrmConfirmDados} /> */}
            


        </Switch>
    </BrowserRouter>
)

export default Routes