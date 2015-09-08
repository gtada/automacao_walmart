# encoding: utf-8
Dado(/^que ao acessar a tela do Walmart\.$/) do
  visit 'http://www.walmart.com.br/'
end
Quando(/^ao efetuar busca tv$/) do
  
  fill_in 'suggestion-search',with: 'tv'
  click_button ('Procurar')
end
Então(/^deve aparecer a opção da busca\.$/) do
  expect(page).to have_content('Resultados de busca para "tv"') 
end
Dado(/^que estou na tela de compras$/) do
  visit 'http://www.walmart.com.br/busca/?ft=tv&PS=20'
end
Quando(/^ao efetuar click na tv desejado\.$/) do
 all('.shelf-item.item-0.with-buy-box').first.click
 all('span.dec').first.click
end
Então(/^deve aparecer a descrição da opção selecionada\.$/) do
  expect(page).to have_content('Smart TV LED Full HD 43') 
end
Dado(/^que estou na tela de descrição do produto\.$/) do
   visit 'http://www.walmart.com.br/smart-tv-led-full-hd-43-lg-43lf6350-webos-3-usb-3-hdmi-wi-fi-integrado/3088158/pr'
end
Quando(/^ao efetuar o click no carrinho\.$/) do
	expect(page).to have_content('Smart TV LED Full HD 43') 
	find(:css, 'button.buy-button.btn.btn-success').click
  click_button('Continuar')
    
end
Então(/^devo adicionar a tv no carrinho\.$/) do
	find(:css, '.cart').click
   expect(page).to have_content('Comprar') 
  click_on("Comprar")
 
end

Dado(/^que estou  na tela de login\.$/) do
visit 'https://www2.walmart.com.br/checkout/content/carrinho/'

end

Quando(/^ao efetuar o click em Cadastre se\.$/) do

click_on("Cadastre-se")

 within_frame('iframeLogin') do 
@email= Faker::Internet.email
@person_name= Faker::Name.name
@cpf= Faker::CPF.numeric
@senha= Faker::Internet.password

fill_in 'Nome completo', with: @person_name
fill_in 'E-mail', with: @email
fill_in 'CPF ou CNPJ', with: @cpf
fill_in 'Telefone', with: '1132712345'
fill_in 'Senha',with: @senha
fill_in 'Confirmar senha',with: @senha
click_button('Cadastrar') 
end
end  


Então(/^cadastro deve ser efetuado com sucesso\.$/) do
 sleep 60
expect(page).to have_content('Smart TV LED Full HD 43')
all('.profile-img').first.click
expect(page).to have_content('Bem-vindo à sua conta') 

end
