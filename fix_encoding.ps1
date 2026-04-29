$path = Join-Path (Get-Location) 'index.html'
$text = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

$formReplacement = @"
      <div class="form-wrap">
        <h3>Inscreva-se e saiba mais</h3>
        <p class="form-note"><span>*</span> indica campos obrigatórios</p>

        <!--
          GOOGLE SHEETS:
          Substitua ACTION_URL pelo URL do seu Google Apps Script
          e mantenha os "name" de cada input iguais às colunas da planilha.
        -->
        <form id="contact-form" action="https://script.google.com/macros/s/AKfycbwjTLOJtACmjtqORn1J1q-Pqbpxwz9iKqU2Y9HHD-lMwZxi78DodVXOeMNdaPLX2uEp/exec" method="POST">
          <div class="form-group">
            <label for="nome">Nome Completo <span class="req">*</span></label>
            <input type="text" id="nome" name="Nome Completo" placeholder="Seu nome completo" required />
          </div>
          <div class="form-group">
            <label for="email">E-mail <span class="req">*</span></label>
            <input type="email" id="email" name="E-mail" placeholder="seu@email.com" required />
          </div>
          <div class="form-group">
            <label for="celular">Número de Celular <span class="req">*</span></label>
            <input type="tel" id="celular" name="Número de Celular" placeholder="(00) 00000-0000" required />
          </div>
          <div class="form-group">
            <label for="empresa">Nome da Empresa / Instituição <span class="req">*</span></label>
            <input type="text" id="empresa" name="Nome da Empresa" placeholder="Nome da IES ou empresa" required />
          </div>
          <div class="form-group">
            <label for="cargo">Cargo <span class="req">*</span></label>
            <input type="text" id="cargo" name="Cargo" placeholder="Seu cargo atual" required />
          </div>
          <button type="submit" class="btn-submit">Enviar Inscrição</button>
          <div id="form-msg"></div>
        </form>
      </div>
"@

$difReplacement = @"
      <ul class="dif-list">
        <li>Metodologia autoral baseada em experiência real de gestão universitária;</li>
        <li>Corpo docente com atuação prática em reitorado, redes internacionais e conselhos empresariais;</li>
        <li>Networking entre decisores de diferentes IES;</li>
        <li>Foco em resultados institucionais e não apenas em teoria.</li>
      </ul>
"@

$vagasReplacement = @"
      <ul>
        <li>Apenas 1 representante por IES (com opção de pacote duplo);</li>
        <li>Processo de entrada orientado por perfil estratégico, não por volume. Esse modelo garante alto nível de troca, networking qualificado e posicionamento premium;</li>
      </ul>
"@

$text = [regex]::Replace($text, '(?s)      <div class="form-wrap">.*?      </div>', [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $formReplacement }, 1)
$text = [regex]::Replace($text, '(?s)      <ul class="dif-list">.*?      </ul>', [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $difReplacement }, 1)
$text = [regex]::Replace($text, '(?s)      <ul>\s*<li>Apenas 1 representante por IES.*?      </ul>', [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $vagasReplacement }, 1)

$text = $text.Replace('Conheï¿½a nosso Corpo Docente', 'Conheça nosso Corpo Docente')
$text = $text.Replace('Gestor de Projetos, Assessor de Inovaï¿½ï¿½o e Professor', 'Gestor de Projetos, Assessor de Inovação e Professor')
$text = $text.Replace('Andrï¿½ Scaranti', 'André Scaranti')
$text = $text.Replace('Secretï¿½rio de Desenvolvimento Econï¿½mico de Varginha (MG)', 'Secretário de Desenvolvimento Econômico de Varginha (MG)')
$text = $text.Replace('AIIC ï¿½ Academia Internacional de Inovaï¿½ï¿½o Corporativa', 'AIIC — Academia Internacional de Inovação Corporativa')
$text = $text.Replace('aria-label="fechar">?</button>', 'aria-label="fechar">✕</button>')
$text = $text.Replace('Lï¿½der executivo com sï¿½lida carreira internacional, atuando em grandes empresas no Brasil, Amï¿½rica Latina (Chile, Peru, Argentina), EUA e Europa (Alemanha, Polï¿½nia). Especialista em estruturar e escalar organizaï¿½ï¿½es atravï¿½s do desenvolvimento integrado de processos e pessoas, com uma gestï¿½o profundamente humanizada.<br><br>', 'Líder executivo com sólida carreira internacional, atuando em grandes empresas no Brasil, América Latina (Chile, Peru, Argentina), EUA e Europa (Alemanha, Polônia). Especialista em estruturar e escalar organizações através do desenvolvimento integrado de processos e pessoas, com uma gestão profundamente humanizada.<br><br>')
$text = $text.Replace('A abordagem jï¿½ resultou na conduï¿½ï¿½o de +14 projetos focados no capital humano, gerando resultados sï¿½lidos, seguros e consistentes para os negï¿½cios. ï¿½ autor do livro "Conectando Pessoas, Transformando Negï¿½cios" e palestrante sobre lideranï¿½a, gestï¿½o de pessoas, processos e humanizaï¿½ï¿½o no ambiente corporativo.', 'A abordagem já resultou na condução de +14 projetos focados no capital humano, gerando resultados sólidos, seguros e consistentes para os negócios. É autor do livro "Conectando Pessoas, Transformando Negócios" e palestrante sobre liderança, gestão de pessoas, processos e humanização no ambiente corporativo.')
$text = $text.Replace('Profissional com sï¿½lida experiï¿½ncia internacional, atuando na interseï¿½ï¿½o entre educaï¿½ï¿½o, inovaï¿½ï¿½o, desenvolvimento institucional e relaï¿½ï¿½es internacionais. Especializado em parcerias estratï¿½gicas, gestï¿½o de projetos complexos e desenvolvimento de negï¿½cios corporativos e educacionais, destacando-se na criaï¿½ï¿½o de soluï¿½ï¿½es personalizadas para setores diversos ï¿½ incluindo indï¿½stria, ensino superior e setor pï¿½blico ï¿½ com foco em impacto real e mensurï¿½vel.', 'Profissional com sólida experiência internacional, atuando na interseção entre educação, inovação, desenvolvimento institucional e relações internacionais. Especializado em parcerias estratégicas, gestão de projetos complexos e desenvolvimento de negócios corporativos e educacionais, destacando-se na criação de soluções personalizadas para setores diversos — incluindo indústria, ensino superior e setor público — com foco em impacto real e mensurável.')
$text = $text.Replace('<!-- Andrï¿½ Scaranti -->', '<!-- André Scaranti -->')
$text = $text.Replace('Engenheiro Mecï¿½nico especialista em Robï¿½tica e Automaï¿½ï¿½o. Expertise em Combustï¿½o Industrial. Hï¿½ 25 anos na indï¿½stria nacional como gestor de equipes e empreendedor.', 'Engenheiro Mecânico especialista em Robótica e Automação. Expertise em Combustão Industrial. Há 25 anos na indústria nacional como gestor de equipes e empreendedor.')
$text = $text.Replace('Doutor em Engenharia Biomï¿½dica, com mais de 12 anos de docï¿½ncia e gestï¿½o acadï¿½mica no ensino superior. Ex-coordenador do Conselho Empresarial do Sul de Minas e ex-diretor de Novos Negï¿½cios e Educaï¿½ï¿½o Corporativa, conectando universidades, grandes empresas e poder pï¿½blico.', 'Doutor em Engenharia Biomédica, com mais de 12 anos de docência e gestão acadêmica no ensino superior. Ex-coordenador do Conselho Empresarial do Sul de Minas e ex-diretor de Novos Negócios e Educação Corporativa, conectando universidades, grandes empresas e poder público.')
$text = $text.Replace('Filï¿½sofo, mestre em Engenharia de Produï¿½ï¿½o e doutor em Educaï¿½ï¿½o, Stefano ï¿½ reconhecido internacionalmente com o tï¿½tulo de Doutor Honoris Causa pela Universidad Autï¿½noma de Encarnaciï¿½n.<br><br>', 'Filósofo, mestre em Engenharia de Produção e doutor em Educação, Stefano é reconhecido internacionalmente com o título de Doutor Honoris Causa pela Universidad Autónoma de Encarnación.<br><br>')
$text = $text.Replace('Fundador do Grupo Educacional Unis, foi Reitor do Centro Universitï¿½rio do Sul de Minas, Presidente da FEPESMIG e idealizador de projetos como o CESUL e o Cesullab. Criou ainda a rede internacional ACINNET, conectando lï¿½deres e instituiï¿½ï¿½es em diversos paï¿½ses.', 'Fundador do Grupo Educacional Unis, foi Reitor do Centro Universitário do Sul de Minas, Presidente da FEPESMIG e idealizador de projetos como o CESUL e o Cesullab. Criou ainda a rede internacional ACINNET, conectando líderes e instituições em diversos países.')

[System.IO.File]::WriteAllText($path, $text, [System.Text.UTF8Encoding]::new($false))
