# Klick — Game Design Document (GDD)

> Documento vivo. Última revisão inicial: 07/11/2026.

## 1. Visão geral

**Nome:** Klick  
**Gênero:** puzzle / aventura interativa  
**Escopo:** jogo independente curto, desenvolvido por uma pessoa  
**Identidade visual:** bonequinho de palitos e elementos desenhados à mão  
**Estrutura:** jornada linear e contínua, sem seleção ou divisão explícita em fases

### Conceito

Um pequeno boneco de palitos precisa atravessar uma jornada. O jogador não usa controles tradicionais de deslocamento: deve clicar, segurar e arrastar o personagem e experimentar com o ambiente para descobrir como progredir.

A graça está em entender as regras por tentativa, observação e descoberta — sem tutoriais textuais aparentes.

## 2. Princípios de design (definidos)

1. **Mouse como mecânica principal**, não apenas como ponteiro de menu.
2. **Experimentação em vez de instrução:** o jogo ensina pelo resultado das ações.
3. **Puzzles integrados à jornada:** a progressão é linear, não um menu de fases.
4. **Animação e ambiente comunicam as regras:** preferir linguagem visual e sonora.
5. **Escopo pequeno:** priorizar interações criativas, não quantidade de sistemas.

## 3. Mecânicas principais

### 3.1. Clicar e arrastar o personagem — definido

- O jogador seleciona o boneco clicando nele.
- Enquanto mantém o botão pressionado, arrasta o personagem com o mouse.
- **WASD não movimenta o personagem.**
- O deslocamento estará sujeito às regras físicas do jogo.

### 3.2. Gravidade e limite de elevação — conceito definido; parâmetros em aberto

- A gravidade atua sobre o personagem.
- Se o jogador elevá-lo **demais**, o personagem **cai automaticamente**.
- Ainda é preciso prototipar se a queda interrompe o arraste imediatamente, se existe limite de alcance/força e como a física se comporta ao soltar o mouse.

### 3.3. Peso variável — mecânica proposta

O boneco poderá **ficar mais pesado ou mais leve**. Esse atributo servirá como base para puzzles, possivelmente afetando a facilidade de arrastar, a interação com mecanismos e a reação à física.

**Não definido:** como se altera o peso, limites e efeitos exatos.

### 3.4. Tamanho/altura do corpo variável — mecânica proposta

O boneco poderá **aumentar ou diminuir de tamanho/altura**, criando desafios espaciais e alterando sua relação com o cenário.

**Não definido:** como o tamanho muda, faixa de escala e interação com colisões.

## 4. Progressão e experiência

- A aventura acontece em sequência, com puzzles que liberam a continuação natural do caminho.
- Não há intenção de estruturar o jogo em fases convencionais.
- O jogador aprende clicando, arrastando, observando as reações e testando hipóteses.
- Evitar textos explicativos visíveis; oferecer pistas acessíveis por composição de cena, animação, áudio e feedback.
- O tom, a história e o final ainda não foram decididos.

## 5. Direção visual e narrativa

- Personagem principal: **stickman desenhado à mão**.
- Humor e expressividade podem ser comunicados por animações simples.
- Experiência visual e ambiental sem depender de diálogo ou instruções textuais.
- As referências de experiências contemplativas **não definem automaticamente a estética** do Klick.

## 6. Recorte para o primeiro protótipo

Objetivo: validar se *arrastar um personagem sujeito à gravidade* é divertido e permite descobertas.

**Protótipo mínimo:**

1. Um boneco e um chão com colisão.
2. Clique, segure e arraste o boneco.
3. Limite de elevação com queda automática.
4. Um obstáculo simples resolvido usando apenas o mouse.

**Critério de sucesso:** alguém consegue experimentar os controles e superar o obstáculo sem receber um tutorial textual.

## 7. Questões em aberto

- Qual engine, plataforma e linguagem usar?
- O jogador pode segurar o personagem indefinidamente abaixo do limite de altura?
- A queda acontece durante o arraste ou ao soltar o mouse?
- O peso altera a física de que maneira?
- Tamanho maior/menor muda hitbox, massa e alcance do arraste?
- O cursor pode interagir diretamente com objetos do cenário?
- Haverá história explícita ou apenas narrativa ambiental?
- Qual será a duração final? (Ainda não definida.)

## 8. Referências

Ver [REFERENCIAS.md](REFERENCIAS.md).
