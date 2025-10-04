#!/bin/bash

# Простая сборка сайта с темной темой
# Использование: ./build-dark.sh

echo "🌙 Сборка сайта с темной темой..."

# Очищаем предыдущую сборку
echo "🧹 Очищаем предыдущую сборку..."
rm -rf _site
mkdir -p _site

# Копируем основные файлы
echo "📁 Копируем файлы..."
cp -r docs _site/
cp -r assets _site/

# Создаем главную страницу с темной темой
echo "📝 Создаем главную страницу..."
cat > _site/index.html << 'EOF'
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hardware Backdoors Wiki - Dark Theme</title>
    <link rel="stylesheet" href="assets/css/dark-theme.css">
    <style>
        body { margin: 0; padding: 20px; line-height: 1.6; }
        .container { max-width: 1200px; margin: 0 auto; }
        .header { text-align: center; margin-bottom: 40px; padding: 20px; border-bottom: 2px solid #4fc3f7; }
        .nav { display: flex; justify-content: center; gap: 20px; margin: 20px 0; flex-wrap: wrap; }
        .nav a { padding: 10px 20px; background-color: #2d2d2d; border-radius: 5px; text-decoration: none; transition: all 0.3s ease; }
        .nav a:hover { background-color: #4fc3f7; color: #1a1a1a !important; }
        .content { margin: 40px 0; }
        .stats { background-color: #2a2a2a; padding: 20px; border-radius: 10px; margin: 20px 0; }
        .warning { background-color: #2a2a2a; border-left: 4px solid #ff6b6b; padding: 20px; margin: 20px 0; border-radius: 5px; }
        .info-box { background-color: #2a2a2a; border-left: 4px solid #4fc3f7; padding: 20px; margin: 20px 0; border-radius: 5px; }
        .info-box h4 { color: #4fc3f7; margin: 0 0 15px 0; }
        .info-box p { color: #e0e0e0; margin: 0; line-height: 1.6; }
        .code-example { background-color: #2d2d2d; padding: 15px; border-radius: 5px; margin: 15px 0; overflow-x: auto; }
        
        /* Sections grid */
        .sections-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); 
            gap: 20px; 
            margin: 30px 0; 
        }
        
        .section-card { 
            background-color: #2a2a2a; 
            border: 1px solid #333; 
            border-radius: 10px; 
            padding: 20px; 
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .section-card:hover { 
            transform: translateY(-5px); 
            border-color: #4fc3f7; 
            box-shadow: 0 10px 25px rgba(79, 195, 247, 0.2);
        }
        
        .section-card h3 { 
            color: #4fc3f7; 
            margin: 0 0 15px 0; 
            font-size: 1.2em;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .section-card p { 
            color: #e0e0e0; 
            margin: 0 0 20px 0; 
            line-height: 1.5;
            font-size: 0.95em;
        }
        
        .section-link { 
            display: inline-block; 
            background-color: #4fc3f7; 
            color: #1a1a1a !important; 
            padding: 8px 16px; 
            border-radius: 5px; 
            text-decoration: none; 
            font-weight: bold;
            transition: all 0.3s ease;
            font-size: 0.9em;
        }
        
        .section-link:hover { 
            background-color: #81d4fa; 
            transform: scale(1.05);
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .sections-grid { 
                grid-template-columns: 1fr; 
                gap: 15px; 
            }
            
            .section-card { 
                padding: 15px; 
            }
            
            .section-card h3 { 
                font-size: 1.1em; 
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔒 Hardware Backdoors Wiki</h1>
            <p>Полная техническая wiki по аппаратным и микропрограммным бэкдорам вне BIOS/UEFI</p>
        </div>
        
        <div class="nav">
            <a href="docs/wiki-beyond-bios/index.html">📖 Wiki</a>
            <a href="docs/wiki-beyond-bios/09-case-studies/">🔬 Кейсы</a>
            <a href="docs/wiki-beyond-bios/07-tools-and-commands.html">🛠️ Инструменты</a>
            <a href="docs/wiki-beyond-bios/14-checklists.html">✅ Чеклисты</a>
        </div>
        
        <div class="content">
            <h2>🎯 О проекте</h2>
            <div class="stats">
                <p>Данный проект представляет собой <strong>теоретическое исследование</strong> возможных векторов атак на аппаратном уровне компьютерных систем. Материал создан в образовательных целях для понимания архитектуры современных вычислительных устройств и потенциальных уязвимостей.</p>
                
                <h3>🔍 Зачем это нужно?</h3>
                <ul>
                    <li><strong>Образование:</strong> Понимание архитектуры аппаратного обеспечения за пределами BIOS</li>
                    <li><strong>Исследование:</strong> Изучение скрытых возможностей периферийных устройств</li>
                    <li><strong>Безопасность:</strong> Анализ новых векторов атак на аппаратном уровне</li>
                    <li><strong>Развитие:</strong> Совершенствование методов защиты современных систем</li>
                </ul>
                
                <h3>📚 Что изучаем?</h3>
                <ul>
                    <li><strong>Периферийные устройства:</strong> USB-контроллеры, сетевые адаптеры, аудио-видео компоненты</li>
                    <li><strong>Встроенная память:</strong> Flash, EEPROM, NVRAM в различных устройствах</li>
                    <li><strong>Возможности записи:</strong> Скрытые интерфейсы для модификации прошивок</li>
                    <li><strong>Архитектурные особенности:</strong> Как современные системы отличаются от классических BIOS</li>
                </ul>
                
                <div class="info-box">
                    <h4>💡 Почему именно периферия и память материнской платы?</h4>
                    <p>Бэкдоры в BIOS/UEFI уже хорошо изучены, но современные материнские платы содержат множество скрытых компонентов: микроконтроллеры управления питанием, дополнительные чипы памяти, контроллеры интерфейсов. Каждый из этих компонентов имеет собственную память и возможности обновления прошивки, которые часто остаются вне поля зрения традиционных методов анализа безопасности.</p>
                </div>
            </div>
            
            
            <h2>📚 Основные разделы</h2>
            <div class="sections-grid">
                <div class="section-card">
                    <h3>🔍 Введение и модель угроз</h3>
                    <p>Теоретические основы анализа аппаратных угроз за пределами BIOS. Фокус на памяти материнской платы, микроконтроллерах и скрытых интерфейсах.</p>
                    <a href="docs/wiki-beyond-bios/01-intro-threat-model.html" class="section-link">Изучить →</a>
                </div>
                
                <div class="section-card">
                    <h3>🏗️ Архитектура платформы</h3>
                    <p>Обзор скрытой архитектуры материнских плат. Изучение микроконтроллеров управления, дополнительной памяти, периферийных чипов и их скрытых интерфейсов программирования.</p>
                    <a href="docs/wiki-beyond-bios/02-architecture-zoo.html" class="section-link">Изучить →</a>
                </div>
                
                <div class="section-card">
                    <h3>🔧 Микроконтроллеры платформы</h3>
                    <p>Анализ микроконтроллеров на материнской плате. Изучение их собственной памяти, интерфейсов программирования и возможностей модификации прошивок.</p>
                    <a href="docs/wiki-beyond-bios/03-platform-mcus.html" class="section-link">Изучить →</a>
                </div>
                
                <div class="section-card">
                    <h3>🖥️ Периферия с обновляемыми прошивками</h3>
                    <p>Исследование периферийных устройств с собственной памятью. USB-контроллеры, сетевые адаптеры, аудио-видео компоненты с возможностью записи прошивок.</p>
                    <a href="docs/wiki-beyond-bios/04-peripherals-fw.html" class="section-link">Изучить →</a>
                </div>
                
                <div class="section-card">
                    <h3>💾 Типы энергонезависимой памяти</h3>
                    <p>Изучение скрытой памяти на материнской плате и в периферийных устройствах. Flash, EEPROM, NVRAM вне BIOS и их роль в хранении конфигураций.</p>
                    <a href="docs/wiki-beyond-bios/05-nonvolatile-memory.html" class="section-link">Изучить →</a>
                </div>
                
                <div class="section-card">
                    <h3>🔗 Пути записи из ОС</h3>
                    <p>Анализ способов взаимодействия операционной системы с аппаратным обеспечением. Драйверы, системные вызовы и интерфейсы доступа.</p>
                    <a href="docs/wiki-beyond-bios/06-os-write-paths.html" class="section-link">Изучить →</a>
                </div>
                
                <div class="section-card">
                    <h3>🛠️ Инструменты и команды</h3>
                    <p>Обзор программных инструментов для анализа аппаратного обеспечения. Утилиты диагностики, мониторинга и исследования прошивок.</p>
                    <a href="docs/wiki-beyond-bios/07-tools-and-commands.html" class="section-link">Изучить →</a>
                </div>
                
                <div class="section-card">
                    <h3>🔬 Практические кейсы</h3>
                    <p>Детальные примеры анализа различных типов устройств. USB-контроллеры, сетевые адаптеры, аудио-видео компоненты и другие.</p>
                    <a href="docs/wiki-beyond-bios/09-case-studies/" class="section-link">Изучить →</a>
                </div>
            </div>
            
            <div class="warning">
                <h3>⚠️ ВАЖНЫЙ ДИСКЛЕЙМЕР</h3>
                <p><strong>ДАННЫЙ ПРОЕКТ ЯВЛЯЕТСЯ ВЫДУМКОЙ И ОБРАЗОВАТЕЛЬНЫМ МАТЕРИАЛОМ!</strong></p>
                <ul>
                    <li>🚫 <strong>НЕ СУЩЕСТВУЕТ:</strong> Все описанные методы и техники являются теоретическими</li>
                    <li>🎓 <strong>ТОЛЬКО ДЛЯ ОБУЧЕНИЯ:</strong> Материал предназначен исключительно для образования</li>
                    <li>🔬 <strong>ИССЛЕДОВАТЕЛЬСКИЙ ХАРАКТЕР:</strong> Это теоретическое изучение архитектуры</li>
                    <li>⚖️ <strong>СОБЛЮДЕНИЕ ЗАКОНОВ:</strong> Используйте только на собственных системах</li>
                    <li>🛡️ <strong>ЭТИЧНОСТЬ:</strong> Все действия должны быть законными и этичными</li>
                </ul>
                <p><em>Автор не несет ответственности за неправомерное использование информации.</em></p>
            </div>
        </div>
    </div>
</body>
</html>
EOF

# Конвертируем Markdown файлы в простой HTML с темной темой
echo "🔄 Конвертируем Markdown файлы..."
find _site/docs -name "*.md" -type f | while read file; do
    html_file="${file%.md}.html"
    echo "Converting: $file -> $html_file"
    
    # Простая конвертация с темной темой
    cat > "$html_file" << EOF
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$(basename "$file" .md)</title>
    <link rel="stylesheet" href="../../assets/css/dark-theme.css">
    <style>
        body { margin: 0; padding: 20px; line-height: 1.6; }
        .container { max-width: 1200px; margin: 0 auto; }
        .nav { margin: 20px 0; }
        .nav a { color: #4fc3f7; text-decoration: none; }
        .nav a:hover { color: #81d4fa; }
        pre { white-space: pre-wrap; font-family: inherit; }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="../../index.html">← Назад к главной</a>
        </div>
        <div class="content">
            <pre>$(cat "$file")</pre>
        </div>
    </div>
</body>
</html>
EOF
done

# Проверяем результат
if [ -d "_site" ]; then
    echo "✅ Сборка завершена успешно!"
    echo "📁 Сайт собран в папку: _site/"
    echo "📊 Статистика сборки:"
    echo "   - Файлов: $(find _site -type f | wc -l)"
    echo "   - Размер: $(du -sh _site | cut -f1)"
    echo ""
    echo "🌐 Для предпросмотра запустите:"
    echo "   cd _site && python3 -m http.server 3000"
    echo "   Затем откройте: http://localhost:3000"
else
    echo "❌ Ошибка сборки!"
    exit 1
fi
