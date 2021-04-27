require 'net/http'
require 'json'

class IndexController < ApplicationController    
    URL = 'https://api.github.com/search/repositories'
    TOKEN_API_GITHUB = '$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'
    USERNAME = 'paulovf'
    FRAMEWORKS = ['node', 'django', 'rails', 'dotnet', 'php']
    LINGUAGENS = ['node', 'python', 'ruby', 'dotnet', 'php']

    def index
    end
    
    def get_list_repositories
        listResp = []
        index = 0
        FRAMEWORKS.each do |framework|
            requisicao, http = criarRequisicao(LINGUAGENS[index], framework)
            listResp << {linguagem: getJsonList(http.request(requisicao))}
            index = index + 1
        end
        salvar_objeto_repositorio_banco(listResp)
        render json: {'repositorios': listResp}, adapter: :json
    end

    def criarRequisicao(ling, framework)
        url = URI.parse(URL + "?q=" + framework + "language%3A" + ling + "&type=Repositories")
        requisicao = Net::HTTP::Get.new(url.request_uri)
        requisicao["Accept"] = "Accept: application/vnd.github.mercy-preview+json"
        requisicao.set_form_data({'username'=>USERNAME, 'password'=>TOKEN_API_GITHUB})

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = (url.scheme == "https")
        return requisicao, http
    end

    def getJsonList(response)
        return ActiveSupport::JSON.decode(response.body.force_encoding("utf-8"))
    end

    def salvar_objeto_repositorio_banco(json)
        json.each do |item|
            if item[:linguagem][:message]
                return
            else
                item[:linguagem]['items'].each do |subitem|
                    repositorio = Repositorio.find_or_initialize_by(nome: "full_name")
                    repositorio = criar_objeto_repositorio(repositorio, subitem)
                    repositorio.save
                end
            end
        end
    end

    def criar_objeto_repositorio(repositorio, subitem)
        repositorio.nome = subitem['full_name']
        repositorio.descricao = subitem['description']
        repositorio.score = subitem['score']
        repositorio.data_criacao = subitem['created_at']
        repositorio.curated = subitem['curated'] == 'true' ? true : false
        repositorio.featured = subitem['featured'] == 'true' ? true : false
        repositorio.private = subitem['pruvate'] == 'true' ? true : false
        repositorio.forks = subitem['forks']
        repositorio.url = subitem['html_url']
        return repositorio
    end
end
