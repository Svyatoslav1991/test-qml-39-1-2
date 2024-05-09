import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

// Определение главного окна приложения
Window {
    // Настройки видимости, размера и заголовка окна
    visible: true
    width: 640
    height: 480
    title: qsTr("39-1") // Заголовок окна

    // Внутренний столбец элементов
    Column{
        id: mainElements
        anchors.fill: parent // Растягивание столбца на всю доступную область
        spacing: 10 // Отступ между элементами в столбце

        // Ряд, содержащий элементы управления
        Row{
            spacing: 5 // Отступ между элементами в ряду
            width: parent.width - 20 // Ширина ряда

            // Элемент выбора значения с числовым вводом
            SpinBox{
                id: spacingSpinBox
                onValueChanged: {
                    mainElements.spacing = value // Изменение отступа между элементами столбца при изменении значения в SpinBox
                }
            }

            // Элемент выбора значения из предопределенного списка
            ComboBox{
                id: currentColor
                width: parent.width * 2/3 // Ширина ComboBox
                model: ["red", "yellow", "green"] // Список доступных цветов
            }

            // Флажок для управления наличием границы у прямоугольника
            CheckBox{
                id:hasBorder
                onCheckStateChanged: {
                    if(checkState === Qt.Checked)
                    {
                        colorBox.border.width = 10 // Установка ширины границы при активации флажка
                    }
                    else
                    {
                        colorBox.border.width = 0 // Удаление границы при деактивации флажка
                    }
                }
            }

            // Кнопка для выхода из приложения
            Button{
                text: "quit"
                onClicked: Qt.quit(); // Функция выхода из приложения при нажатии на кнопку
            }
        }

        // Прямоугольник для отображения выбранного цвета
        Rectangle{
            id: colorBox
            width: parent.width - 20 // Ширина прямоугольника
            height: parent.height - 40 // Высота прямоугольника
            color: currentColor.currentText // Цвет прямоугольника, выбранный в ComboBox
            border.width: 0 // Начальная ширина границы
            border.color: "black" // Цвет границы
        }
    }
}
