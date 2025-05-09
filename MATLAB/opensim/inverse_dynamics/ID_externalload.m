function ID_externalload(force_file)
% 创建DOM节点
docNode = com.mathworks.xml.XMLUtils.createDocument('OpenSimDocument');

% 获取根元素
docRootNode = docNode.getDocumentElement;
docRootNode.setAttribute('Version', '40500');

% 创建ExternalLoads元素
externalLoads = docNode.createElement('ExternalLoads');
docRootNode.appendChild(externalLoads);

% 创建objects元素
objects = docNode.createElement('objects');
externalLoads.appendChild(objects);
%%
% 创建第一个ExternalForce元素
externalForce_0 = docNode.createElement('ExternalForce');
externalForce_0.setAttribute('name', 'externalForce_0');
objects.appendChild(externalForce_0);

% 添加force_left的子元素
ID_addElement(docNode, externalForce_0, 'applied_to_body', 'calcn_l');
ID_addElement(docNode, externalForce_0, 'force_expressed_in_body', 'ground');
ID_addElement(docNode, externalForce_0, 'point_expressed_in_body', 'ground');
ID_addElement(docNode, externalForce_0, 'force_identifier', 'ground_force_v');
ID_addElement(docNode, externalForce_0, 'point_identifier', 'ground_force_p');
% ID_addElement(docNode, externalForce1, 'torque_identifier', 'ground_torque_');
ID_addElement(docNode, externalForce_0, 'data_source_name', force_file);

%%
% 创建第二个ExternalForce元素
externalForce_1 = docNode.createElement('ExternalForce');
externalForce_1.setAttribute('name', 'externalForce_1');
objects.appendChild(externalForce_1);

% 添加force_right的子元素
ID_addElement(docNode, externalForce_1, 'applied_to_body', 'calcn_r');
ID_addElement(docNode, externalForce_1, 'force_expressed_in_body', 'ground');
ID_addElement(docNode, externalForce_1, 'point_expressed_in_body', 'ground');
ID_addElement(docNode, externalForce_1, 'force_identifier', '1_ground_force_v');
ID_addElement(docNode, externalForce_1, 'point_identifier', '1_ground_force_p');
% ID_addElement(docNode, externalForce2, 'torque_identifier', '1_ground_torque_');
ID_addElement(docNode, externalForce_1, 'data_source_name', force_file);
%%
% 创建groups元素
groups = docNode.createElement('groups');
externalLoads.appendChild(groups);

% 创建datafile元素
datafile = docNode.createElement('datafile');
datafile.appendChild(docNode.createTextNode(force_file));
externalLoads.appendChild(datafile);

% 保存XML文件
xmlFileName = 'ExternalLoads.xml';
xmlwrite(xmlFileName, docNode);





