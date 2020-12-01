import React, { Component } from 'react';
import FormDadosPessoais from './FormDadosPessoais';
import FormEndereco from './FormEndereco'
import FormEspecialidades from './FormEspecialidades';
import FormDocumentos from './FormDocumentos';
import FormFotoPerfil from './FormFotoPerfil'
import api from '../../../services/api'
import { alertSucess, alertError } from '../../alerts/alert'
import $ from 'jquery';
import './css/custom.css'
import M from 'materialize-css'
import axios from 'axios'

class RotasCadastro extends Component {

	constructor(props) {
		super(props)

		this.stateInicial = {
			etapa: 1,
			nome: '',
			cep: '',
			telefone: '',
			especialidades: [],
			selected: [],
			isChecked: false,
			cpf: '',
			email: '',
			senha: '', 
			base64: '',
			errosCepCaixaVazia: '',
			erroMinimoCaracter: '',
			erroMaximoCaracter: '',
			erroNumero: '',
			erroCelular: '',
			erroEmailInvalido: '',
			erroSenha: '',
			erroCpf: '',
			erroCpfIncompleto: '',
			erroEsp:'',

			imagemPerfil: [],
			dados : {
				filename: '',
				mimetype: '',
				base64: '',
			},
			
			data_nascimento:'',
			erroData_nascimento: '',
			foto_perfil:'',
			erroNumeroVazio:'',
			bairro:'',
			cidade:'',
			uf:'',
			endereco:'',
			numeroCasa:'',
			idEndereco:'',
			tipoFotogrado:''
		};
		
		this.state = this.stateInicial
		this.handleChecked = this.handleChecked.bind(this)
	}

	location = () => {
		this.props.location();
	}

	proximaEtapa = () => {
		const { etapa } = this.state;
		this.setState({
			etapa: etapa + 1
		});
	};

	etapaAnterior = () => {
		const { etapa } = this.state;
		this.setState({
			etapa: etapa - 1
		});
	};

	//validação da primeira etapa do formulario
	FormDadosPessoaisForm = () => {
		let erroMinimoCaracter = "";
		let erroMaximoCaracter = "";
		let erroNumero = "";
		let erroCelular = "";
		let erroData_nascimento = "";

		if (this.state.nome.length < 3 || this.state.nome.length == '') {
			erroMinimoCaracter = 'Dígite seu nome, no mínimo 3 caracteres!'
		}
		
		if (this.state.telefone == 0 || this.state.telefone.length == 1) {
			erroCelular = 'Dígite o seu telefone!';
		}
		if (!this.state.nome.match(/^[a-zA-Z ]*$/)) {
			erroNumero = 'No campo nome dígite apenas letras, números não são permitido!'
		}
		if (this.state.data_nascimento.length < 10 || this.state.data_nascimento.length == '') {
			erroData_nascimento = ('Dígite uma data de nascimento válida!')
		}

		if (erroMinimoCaracter || erroMaximoCaracter || erroNumero 
			 
			|| erroCelular || erroData_nascimento) {
			if (erroMinimoCaracter) {
				this.setState({ erroMinimoCaracter });
				M.toast({ html: this.state.erroMinimoCaracter })
			}

			if (erroMaximoCaracter) {
				this.setState({ erroMaximoCaracter });
				M.toast({ html: this.state.erroMaximoCaracter })
			}

			if (erroNumero) {
				this.setState({ erroNumero });
				M.toast({ html: this.state.erroNumero })
			}

			

			if (erroCelular) {
				this.setState({ erroCelular });
				M.toast({ html: this.state.erroCelular })
			}			

			if (erroData_nascimento) {
				this.setState({ erroData_nascimento });
				M.toast({ html: this.state.erroData_nascimento })
			}

			return false
		}

		return true
	}

	//validação da segunda etapa do formulario
	validacaoDocumentos = () => {
		let erroEmailInvalido = '';
		let erroSenha = '';
		let erroCpf = '';
		let erroCpfIncompleto = ''
		const M = window.M;

		if (!this.state.email.includes('@') || !this.state.email.includes('.com')) {
			erroEmailInvalido = 'E-mail incorreto!'
		}
		if (this.state.senha.length < 8 || this.state.senha.length == 0) {
			erroSenha = ('Dígite sua senha, no mínimo 8 caracteres!')
		}
		if (this.state.cpf == 0) {
			erroCpf = 'Por Favor, dígite o seu cpf!';
		}
		if (this.state.cpf.length != 14) {
			erroCpfIncompleto = 'Por Favor, dígite um cpf válido!';
		}
		if (erroEmailInvalido || erroSenha || erroCpf || erroCpfIncompleto) {
			if (erroEmailInvalido) {
				this.setState({ erroEmailInvalido });
				M.toast({ html: this.state.erroEmailInvalido })
			}

			if (erroSenha) {
				this.setState({ erroSenha });
				M.toast({ html: this.state.erroSenha })
			}

			if (erroCpfIncompleto) {
				this.setState({ erroCpfIncompleto });
				M.toast({ html: this.state.erroCpfIncompleto })
			}

			if (erroCpf) {
				this.setState({ erroCpf });
				M.toast({ html: this.state.erroCpf })
			}

			return false
		}

		return true
	}

	//Validacao terceiro form 
	validacaoEspecialidades = () => {
		let erroEsp = '';

		if (this.state.selected.length == 0) {
			erroEsp = ("Escolha a sua especialidade!")
		}

		if(erroEsp ){
			if(erroEsp){
				this.setState({ erroEsp });
				M.toast({ html: this.state.erroEsp })
			}			

			return false
		}

		return true
	}

	validacaoCep = () => {
		// let erroCepInvalido;
		let errosCepCaixaVazia = "";
		let erroNumeroVazio = "";

		// if(this.state.erroCepInvalido === true){
		// 	erroCepInvalido = ("Por favor digite um cep válido")
		// }

		if (this.state.endereco == undefined) {
			errosCepCaixaVazia = 'Dígite um cep válido!';
		}

		if (this.state.numeroCasa == 0) {
			erroNumeroVazio = 'Preencha o número!';
		}

		if(errosCepCaixaVazia || erroNumeroVazio){
			if (errosCepCaixaVazia) {
				this.setState({ errosCepCaixaVazia });
				M.toast({ html: this.state.errosCepCaixaVazia })
			}

			if (erroNumeroVazio) {
				this.setState({ erroNumeroVazio });
				M.toast({ html: this.state.erroNumeroVazio })
			}

			return false
		}

		return true
	}

	buscarCep = async (cep) => { 
		
		const cepHifen = cep;
		const cepReplace = cepHifen.replace('-', '')

		if(cepReplace.length === 8){
		await axios.get('https://viacep.com.br/ws/'+ cepReplace +'/json/')
            .then((res) => {
				this.setState({
					uf: res.data.uf,
					endereco: res.data.logradouro,
					bairro: res.data.bairro,
					cidade: res.data.localidade,
					cep: cepReplace
				})
            }).catch(erro =>{
				console.log(erro) 
            })
       
		}
    
        
	}

	handleImageChange = (event) => {
		let file = event.target.files[0];
		this.setState({imagemPerfil: file})
		let reader = new FileReader();
		reader.readAsDataURL(file);

		reader.onloadend = () => {			
			$('#fotoDePerfil').attr('src', reader.result);		
		}
	}

	UploadImage = () => {
		let imagem = this.state.imagemPerfil
		console.log(imagem)
		let file = imagem;
		
		let reader = new FileReader();
		reader.readAsDataURL(file);

		reader.onloadend = () => {			
			const base64result = reader.result.split(',')[1]
			const name = file.name.split(' ')[0]
				this.setState({
					dados: {
						filename: Date.now() + name,
						mimetype: file.type,
						base64: base64result
					}
				})
				
			
			api.post("/photo/upload/imagem", this.state.dados).then(res => {			
				this.setState({
					foto_perfil: res.data
				})
				this.cadastrar()
				console.log(res.data)
			}).catch(erro => {
				console.log(erro)
			})
		}
	}

	cadastrar = async () => {
		let endereco = {
			numero: this.state.numeroCasa,
			rua: this.state.endereco,
			bairo: this.state.bairro,
			cidade: this.state.cidade,
			estado: this.state.uf,
			pais:"br", 
			cep: this.state.cep
		}
		
		await api.post('/photo/endereco/', endereco
		).then((res) => {
			this.setState({
				idEndereco: res.data.id
			})
			this.cadastroFotografo();
		}).catch(erro => {
			console.log(erro)
		})
	}

	cadastroFotografo = async () =>{

		const token = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmb3RvZ3JhZm9AdGVzdGUuY29tIiwicm9sZXMiOlsiQURNSU4iXSwiaWF0IjoxNTkyODM0Njc0LCJleHAiOjE1OTI5MjEwNzR9.p4NfLYnyfl6XMBrIAAmMR-r2HpyPFDJfuoH8pkzpHR-BNqS_S2JyAzklig-gXVH_ce9plTUX9KTrtmXcpgF8yA'
        
        let config = {
            headers: {
                'Authorization': token,
                "Accept":"application/json",
                'Content-Type': 'application/json'
            }
		}
		
		let dados = {
			nome: this.state.nome,
			cpf: this.state.cpf,
			telefone: this.state.telefone,
			cep: this.state.cep,
			email: this.state.email,
			role: "ADMIN",
			senha: this.state.senha,
			experiencia: this.state.tipoFotogrado,
			especialidades: this.state.selected,
			fotoPerfil: this.state.foto_perfil,
			data_nascimento: this.state.data_nascimento,
			enderecos:{ id: this.state.idEndereco}
		}

		await api.post('/photo/fotografo', dados, config
		).then((res) => {
			this.setState(this.stateInicial)
			this.alertSucess()
			this.location()
		}).catch(erro => {
			this.alertError()
			console.log(erro)
		})
	}

	handleChecked() {
		this.setState({ isChecked: !this.setState.isChecked })
	}

	componentDidMountFunction = () => {
		api.get('/photo/especialidades/').then(res => this.setState({ especialidades: res.data.content }))
	}

	handleCheckbox = (e, esp) => {
		const selected = [...this.state.selected];
		if (e.target.checked) {
			selected.push(esp)
		} else {
			const index = selected.findIndex((ch) => ch.roomId === esp.roomId);
			selected.splice(index, 1);
		}
		this.setState({ selected });
	}

	
	selecaoTipoFotografo = (e) => {
		this.setState({
			tipoFotogrado: e.target.value
		})
	}	

	alertSucess = () => {
		alertSucess('Obrigado!','Sua conta foi criada com sucesso' )
	}

	alertError = () => {
		alertError('Erro ao cadastrar','Tivemos algum problema com o seu cadastro, por favor tente novamente')
	}

	// Input Handler
	handleChange = input => e => {
		this.setState({ [input]: e.target.value });
	};

	render() {
		const { etapa } = this.state;
		const { nome, cep, telefone, cpf, email, senha, especialidades, data_nascimento,base64, mimetype, cidade, uf, numeroCasa, endereco, bairro, tipoFotogrado } = this.state;
		const values = { nome, cep, telefone, cpf, email, senha, especialidades, data_nascimento, cidade, uf, numeroCasa, endereco, bairro, tipoFotogrado };

		switch (etapa) {
			case 1:
				return (
					<FormDadosPessoais
						proximaEtapa={this.proximaEtapa}
						handleChange={this.handleChange}
						validacao={this.FormDadosPessoaisForm}
						values={values}
						selecaoTipoFotografo={this.selecaoTipoFotografo}
					/>
				);
			case 2:
				return (
					<FormEndereco
						proximaEtapa={this.proximaEtapa}
						etapaAnterior={this.etapaAnterior}
						buscarCep={this.buscarCep}
						cep={this.state.cep}
						handleChange={this.handleChange}
						validacao={this.validacaoCep}
						values={values}
					/>
				);				
			case 3:
				return (
					<FormDocumentos
						proximaEtapa={this.proximaEtapa}
						etapaAnterior={this.etapaAnterior}
						handleChange={this.handleChange}
						validacao={this.validacaoDocumentos}
						values={values}
					/>
				);
			case 4:
				return (
					<FormEspecialidades
						proximaEtapa={this.proximaEtapa}
						etapaAnterior={this.etapaAnterior}
						handleChange={this.handleChange}
						handleChecked={this.handleChecked}
						validacao={this.validacaoEspecialidades}
						componentDidMountFunction={this.componentDidMountFunction}
						handleCheckbox={this.handleCheckbox}
						especialidades={this.state.especialidades}
						isChecked={this.state.isChecked}
						values={values}
					/>
				);
			case 5:
				return (
					<FormFotoPerfil
						cadastrar={this.UploadImage}
						etapaAnterior={this.etapaAnterior}
						handleChange={this.handleChange}
						handleImageChange={this.handleImageChange}
					/>
				)

			default:
				(alert('error'))
		}
	}
}

export default RotasCadastro;
