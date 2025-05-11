# Branch Color 🎨

Cambia automáticamente el color de tu Visual Studio Code basado en la rama de Git en la que estás trabajando. Mejora tu productividad sabiendo siempre en qué entorno estás trabajando.

## 📋 Características

- Cambio automático de colores al cambiar de rama con `git checkout`
- Soporte para ramas principales, desarrollo, features, hotfixes y releases
- Fácil de instalar y configurar
- No requiere extensiones adicionales de VSCode
- Funciona para todos los proyectos Git

## 🎯 ¿Por qué usar Branch Color?

- **Previene errores**: Sabrás visualmente si estás en producción, desarrollo o una rama de feature
- **Mejora el flujo de trabajo**: Rápida identificación visual de tu entorno actual
- **Sin configuración manual**: El cambio de color es automático después de la instalación

## 🎭 Referencia de Colores

| Rama | Color | Ejemplo |
| ----------------- | ------------------------------------------------------------------ | ----------------- |
| Main | ![#2f7c47](https://via.placeholder.com/10/2f7c47?text=+) #2f7c47 | main, master |
| Staging | ![#fbed80](https://via.placeholder.com/10/fbed80?text=+) #fbed80 | staging |
| Development | ![#ab307e](https://via.placeholder.com/10/ab307e?text=+) #ab307e | development |
| Releases | ![#ff6433](https://via.placeholder.com/10/ff6433?text=+) #ff6433 | releases/main-v2023.06.09, release/v1.0.0 |
| Features | ![#1f6fd0](https://via.placeholder.com/10/1f6fd0?text=+) #1f6fd0 | features/development-change-something, feature/login |
| Hotfix | ![#93e6fc](https://via.placeholder.com/10/93e6fc?text=+) #93e6fc | hotfixes/main-fix-typo, hotfix/fix-login |
| Error | ![#fa1b49](https://via.placeholder.com/10/fa1b49?text=+) #fa1b49 | Cualquier otro formato no reconocido |

## 💻 Instalación

### Instalación Automática (Recomendada)

Ejecuta el siguiente comando en tu proyecto Git:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dhararon/branch-color/master/install.sh)"
```

### Instalación Manual

1. Clona este repositorio:
   ```bash
   git clone https://github.com/dhararon/branch-color.git /tmp/branch-color
   ```

2. Crea el directorio de hooks en tu proyecto si no existe:
   ```bash
   mkdir -p .git/hooks/colors
   ```

3. Copia los archivos de configuración:
   ```bash
   cp -f /tmp/branch-color/colors/*.json ./.git/hooks/colors/
   cp -f /tmp/branch-color/post-checkout ./.git/hooks/
   chmod +x ./.git/hooks/post-checkout
   ```

4. Prueba el cambio de rama:
   ```bash
   git checkout main  # O cualquier otra rama
   ```

## ⚠️ Consideraciones Importantes

- Agrega `.vscode/settings.json` a tu archivo `.gitignore` para evitar conflictos con otros miembros del equipo.
- Los cambios solo se aplican después de un `git checkout`. Si creas una rama nueva, necesitas cambiar a otra rama y volver para ver el cambio de color.

## 🔧 Personalización

Si deseas personalizar los colores para cada tipo de rama:

1. Edita los archivos JSON correspondientes en `.git/hooks/colors/`
2. Cada archivo contiene la configuración de colores para VSCode

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si quieres añadir más características o mejorar el proyecto:

1. Haz fork del repositorio
2. Crea tu rama de feature: `git checkout -b feature/nueva-caracteristica`
3. Haz commit de tus cambios: `git commit -am 'Añadir nueva característica'`
4. Sube tu rama: `git push origin feature/nueva-caracteristica`
5. Envía un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo LICENSE para más detalles.