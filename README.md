# 🎓 Sistema Especialista para Recomendação de Trilha Acadêmica

**Disciplina:** [Programação Logica e Funcional]  
**Professor:** [FRANK COELHO DE ALCANTARA]  
**Aluno:** [João Andreotti]  
---

## 📋 **Descrição do Projeto**

Sistema especialista desenvolvido em Prolog para auxiliar estudantes de cursos de tecnologia na escolha de trilhas de especialização. O sistema utiliza um questionário interativo e um motor de inferência baseado em regras para recomendar as trilhas mais compatíveis com o perfil do estudante.

---

## 🏗️ **Arquitetura do Sistema**

### **Base de Conhecimento:**
- **5 Trilhas de Especialização** com descrições detalhadas
- **7 Características de Perfil** com pesos de relevância (1-5)
- **Sistema de Perguntas** mapeando interesses às características

### **Motor de Inferência:**
- Cálculo de pontuação baseado em pesos
- Ranking automático por compatibilidade
- Justificativa detalhada das recomendações

### **Interface do Usuário:**
- Questionário interativo no terminal
- Validação de entradas (s/n)
- Resultados organizados e justificados

---

## 🎯 **Trilhas Disponíveis**

| Trilha | Descrição |
|--------|-----------|
| **Inteligência Artificial** | Construção de sistemas inteligentes capazes de aprender e tomar decisões |
| **Desenvolvimento Web** | Criação de sites e aplicações web interativas |
| **Segurança da Informação** | Proteção de dados, sistemas e redes contra ataques |
| **Ciência de Dados** | Análise e interpretação de grandes volumes de dados para extrair conhecimento |
| **Redes e Infraestrutura** | Gerenciamento e manutenção de redes de computadores e servidores |

---

## 📊 **Sistema de Pontuação**

### **Características Avaliadas:**
- **Lógica de Programação** - Fundamental para várias trilhas
- **Matemática e Estatística** - Essencial para IA e Ciência de Dados
- **Design Visual** - Importante para Desenvolvimento Web
- **Programação Frontend** - Crucial para Desenvolvimento Web
- **Redes de Computadores** - Fundamental para Redes e Segurança
- **Hardware** - Importante para Infraestrutura
- **Pensamento Crítico** - Relevante para todas as trilhas

### **Sistema de Pesos:**
- **Peso 5:** Característica ESSENCIAL para a trilha
- **Peso 4:** Característica IMPORTANTE para a trilha
- **Peso 3:** Característica MODERADA para a trilha

### **Cálculo da Pontuação:**
A pontuação de cada trilha é calculada somando os pesos das características para as quais o usuário respondeu "SIM".

**Exemplo:** Se um usuário responde SIM para características com pesos 5, 4 e 3, a trilha recebe 12 pontos.

---

## 🚀 **Como Executar**

### **Pré-requisitos:**
- SWI-Prolog instalado ou acesso ao SWISH Prolog Online
- Arquivo `sistema_especialista.pl` carregado

### **Carregar o Sistema:**
```prolog
% No SWI-Prolog:
?- [sistema_especialista].

% No SWISH Online:
% Cole o código na área de edição e execute
```

### **Comandos Disponíveis:**

#### **1. Sistema Interativo (Principal):**
```prolog
?- iniciar.
```
- Faz 7 perguntas interativas
- Responda com `s` (SIM) ou `n` (NÃO)
- Mostra ranking e justificativa

#### **2. Testes Automáticos:**
```prolog
?- perfil_teste1.    % Teste perfil focado em lógica/dados
?- perfil_teste2.    % Teste perfil focado em desenvolvimento web
?- perfil_teste3.    % Teste perfil focado em redes/infraestrutura
```

#### **3. Executar Todos os Testes:**
```prolog
?- executar_todos_testes.
```
- Executa os 3 perfis de teste sequencialmente
- Ideal para validação completa do sistema

---

## 🧪 **Perfis de Teste**

### **📊 Perfil 1 - Lógica e Dados**
```prolog
?- perfil_teste1.
```
**Características:** Forte em lógica, matemática e pensamento crítico  
**Respostas Simuladas:**
- ✅ **SIM:** lógica_programacao, matematica_estatistica, pensamento_critico
- ❌ **NÃO:** design_visual, programacao_frontend, redes_computadores, hardware

**Resultado Esperado:** **Inteligência Artificial** (13 pontos) em 1º lugar
- IA: lógica(5) + matemática(4) + crítico(4) = **13 pontos**
- Ciência de Dados: matemática(5) + lógica(4) + crítico(3) = **12 pontos**

---

### **🌐 Perfil 2 - Desenvolvimento Web**
```prolog
?- perfil_teste2.
```
**Características:** Interessado em design, frontend e com base em lógica  
**Respostas Simuladas:**
- ✅ **SIM:** logica_programacao, design_visual, programacao_frontend, pensamento_critico
- ❌ **NÃO:** matematica_estatistica, redes_computadores, hardware

**Resultado Esperado:** **Desenvolvimento Web** (12 pontos) em 1º lugar
- Web: lógica(3) + design(4) + frontend(5) = **12 pontos**
- IA: lógica(5) + crítico(4) = **9 pontos**

---

### **🔒 Perfil 3 - Redes e Infraestrutura**
```prolog
?- perfil_teste3.
```
**Características:** Focado em redes, hardware e pensamento crítico  
**Respostas Simuladas:**
- ✅ **SIM:** redes_computadores, hardware, pensamento_critico
- ❌ **NÃO:** logica_programacao, matematica_estatistica, design_visual, programacao_frontend

**Resultado Esperado:** **Redes e Infraestrutura** (12 pontos) em 1º lugar
- Redes: redes(5) + hardware(4) + crítico(3) = **12 pontos**
- Segurança: redes(4) + crítico(5) = **9 pontos**

---

## 📈 **Tabela Resumo das Diferenças**

| Perfil | Foco Principal | SIMs Estratégicos | Pontuação Máxima | Trilha Esperada |
|--------|----------------|-------------------|------------------|-----------------|
| **Teste 1** | **Analítico/Matemático** | lógica(5), matemática(5), crítico(5) | **13 pontos** | **Inteligência Artificial** |
| **Teste 2** | **Criativo/Frontend** | design(4), frontend(5), lógica(3), crítico(4) | **12 pontos** | **Desenvolvimento Web** |
| **Teste 3** | **Técnico/Infraestrutura** | redes(5), hardware(4), crítico(5) | **12 pontos** | **Redes e Infraestrutura** |

---

## 🎯 **Exemplo de Execução**

### **Sistema Interativo:**
```
=========================================
  SISTEMA DE RECOMENDAÇÃO DE TRILHAS
   Especializações em Tecnologia
=========================================

1. Você tem afinidade com lógica de programação?
Resposta (s/n): s

2. Você tem afinidade com matemática e estatística?
Resposta (s/n): s

...

=========================================
           RESULTADO FINAL
=========================================
1°. inteligencia_artificial (13 pontos)
   -> Construção de sistemas inteligentes capazes de aprender e tomar decisões.

=========================================
         JUSTIFICATIVA DETALHADA
=========================================

📋 TRILHA: inteligencia_artificial (13 pontos)
   Recomendada devido às seguintes respostas:
   ✓ logica_programacao (peso: 5)
   ✓ matematica_estatistica (peso: 4)
   ✓ pensamento_critico (peso: 4)
```

---

## 🛠️ **Estrutura do Código**

### **Predicados Principais:**
- `iniciar/0` - Inicia o sistema interativo
- `faz_perguntas/0` - Conduz o questionário
- `calcula_pontuacao/2` - Motor de inferência
- `recomenda/2` - Sistema de recomendação
- `exibe_resultado/1` - Apresenta resultados
- `justifica_recomendacao/1` - Explica recomendações

### **Base de Conhecimento:**
- `trilha/2` - Define trilhas e descrições
- `perfil/3` - Mapeia características e pesos
- `pergunta/3` - Define questionário

### **Testes:**
- `perfil_teste1/0`, `perfil_teste2/0`, `perfil_teste3/0` - Perfis automáticos
- `executar_todos_testes/0` - Execução completa de testes

---

## ⚠️ **Observações Importantes**

1. **Respostas Válidas:** s, n, sim, não, nao (case-insensitive)
2. **Ambiente:** Testado no SWISH Prolog Online e SWI-Prolog
3. **Formato:** Sempre termine comandos Prolog com ponto (.)
4. **Interação:** Sistema funciona apenas no terminal/console

---

## 📚 **Tecnologias Utilizadas**

- **Linguagem:** Prolog (SWI-Prolog)
- **Paradigma:** Programação Lógica
- **Técnicas:** Sistemas Especialistas, Motor de Inferência
- **Estruturas:** Fatos dinâmicos, Regras de produção

---

## 🏆 **Resultados Esperados**

O sistema demonstra:
- ✅ **Funcionalidade completa** conforme especificação
- ✅ **Interface robusta** com validação de entradas
- ✅ **Motor de inferência eficiente** baseado em pesos
- ✅ **Justificativas transparentes** das recomendações
- ✅ **Cobertura de testes** com 3 perfis distintos

---

**© 2025 - Sistema Especialista para Recomendação de Trilhas Acadêmicas**
