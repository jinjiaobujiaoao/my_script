% 辅助函数：添加子元素
    function ID_addElement(docNode, parentElement, elementName, textContent)
        element = docNode.createElement(elementName);
        element.appendChild(docNode.createTextNode(textContent));
        parentElement.appendChild(element);
