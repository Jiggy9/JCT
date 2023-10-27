import 'package:jct/models/question.dart';

List<Question> light = [
  const Question(
    'what is the specific issue with the city lights?',
    [
      'Broken Streetlights',
      'Inssufficient lighting',
      'light pollution',
      'flickering lights',
      'Excrssive brightness',
      'Other',
    ],
  ),
  const Question(
    'Is the issue causing a complete power outage for a large area or affecting critical infrastructure?',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'How many customers are affected by the issue?',
    [
      'Fewer than 10',
      '10-100',
      '100-1,000',
      'Over 1,000',
    ],
  ),
  const Question(
    'Is the issue related to a safety hazard, such as exposed electrical wires or damaged utility poles?',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'Is the issue a result of a natural disaster, severe weather, or other emergency situation?',
    [
      'Yes',
      'No',
    ],
  ),
];

List<Question> ucd = [
  const Question(
    'what is the specific issue with the Under Ground Drainage?',
    [
      'Soil erosion',
      'Tree growth',
      'Blockages',
      'Solar panel malfunctions',
    ],
  ),
  const Question(
    'Is the issue related to basic human needs, such as clean water, sanitation, or housing? ',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'How many residents or households are directly affected by the issue?',
    [
      ' A few',
      'Several dozen',
      'Hundreds',
      'Thousands',
    ],
  ),
  const Question(
    'Does the issue pose health and safety risks, such as the spread of disease or substandard living conditions?',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'Is the issue receiving significant attention from local or international organizations, indicating its urgency?',
    [
      'Yes',
      'No',
    ],
  ),
];

List<Question> fire = [
  const Question(
    'what is the specific issue with the fireDepartement?',
    [
      'Electrical fire risks',
      'Safety violations',
      'Combustibles near fire hazards',
      'Faulty fire suppression systems',
      'Excrssive brightness',
      'Other',
    ],
  ),
  const Question(
    'Is the incident an active structure fire or an immediate life-threatening situation?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many lives are at immediate risk or need rescue at the scene?',
    [
      'One or a few',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Is the incident affecting critical infrastructure, such as a hospital, school, or major transportation hub?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the incident related to hazardous materials, chemical spills, or other situations requiring specialized knowledge and equipment?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> civil = [
  const Question(
    'What is the impact of the issue on citizens and the community?',
    [
      'Minimal or no impact',
      'Low impact',
      'Moderate impact',
      'High impact',
    ],
  ),
  const Question(
    'How urgent is the need for resolution?',
    [
      'Not urgent',
      'Low urgency',
      'Moderate urgency',
      'High urgency',
    ],
  ),
  const Question(
    'Does the issue relate to legal compliance or regulatory requirements?',
    [
      'Not related',
      'Minor compliance',
      'Significant compliance,'
          'Major compliance violation',
    ],
  ),
  const Question(
    'How many citizens are directly affected by the issue?',
    [
      'A few individuals',
      'A small group',
      'A significant portion',
      'The entire community',
    ],
  ),
  const Question(
    'What is the potential for the issue to escalate or create broader problems?',
    [
      'Low potential',
      'Moderate potential',
      'High potential',
      'Immediate crisis',
    ],
  ),
];

List<Question> marrige = [
  const Question(
    'what is the specific issue with the merrige?',
    [
      'Cultural',
      'Trust Issues',
      'Religious Differences',
      'Communication Problems',
      'Differences in Life Goals',
      'Other',
    ],
  ),
  const Question(
    'Is the case an urgent matter requiring immediate action, such as a pending wedding or a legal deadline?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Are there child custody or child support issues involved in the case?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Does the case involve allegations of abuse, violence, or other safety concerns?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the case generating significant public or media interest, potentially affecting the departments reputation?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> shop = [
  const Question(
    'What is the specific issue with the shop executive?',
    [
      'Poor Customer Service',
      'Inadequate Staffing',
      'Inventory Issues',
      'Pricing Problems',
      'Store Cleanliness',
      'Other',
    ],
  ),
  const Question(
    'Is the issue causing significant revenue loss or affecting the financial stability of the business?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many customers or transactions are directly impacted by the issue?',
    [
      'A few',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Does the issue relate to a critical product or service, such as a popular or essential item?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Does the issue have the potential to escalate and affect multiple departments or areas of the business?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> underGroundDrainage = [
  const Question(
    'What is the specific issue with the Under Ground Drainage?',
    [
      'Blockages',
      'Frequent backups',
      'Structural damaje',
      'Overflows',
      'Odor problems',
      'Other',
    ],
  ),
  const Question(
    'Is the issue causing immediate flooding, posing a threat to public safety, or damaging property?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many households or businesses are directly affected by the drainage issue?',
    [
      'A few',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Does the issue involve a critical infrastructure, such as a major roadway or public transportation system?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the drainage issue part of a broader problem affecting a larger drainage network or system?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> generalAdmin = [
  const Question(
    'Does the issue pertain to a legal or regulatory compliance matter that requires immediate attention?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the task or issue related to a high-profile event or project with a tight deadline?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many departments or stakeholders are directly impacted by the issue or task?',
    [
      'One',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Does the issue involve a significant financial decision or allocation of resources?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the task or issue generating a substantial volume of inquiries or complaints from the public or employees?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> health = [
  const Question(
    'Is the issue an immediate public health emergency or outbreak?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many individuals or communities are directly affected by the health issue?',
    [
      'A Few',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Does the issue pose a significant risk to vulnerable populations, such as children, the elderly, or individuals with compromised immune systems?',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'Is the health issue linked to a highly contagious disease or a potential epidemic?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the health issue generating widespread concern, media attention, or public demand for intervention?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> waterWorks = [
  const Question(
    'Is the issue causing an immediate health risk due to water quality, such as contamination or unsafe drinking water?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many households or businesses are directly impacted by the water issue?',
    [
      'A Few',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Does the issue involve a critical infrastructure, such as a major water treatment plant or water distribution network?',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'Has the issue been persistent and ongoing, causing long-term disruptions to water supply?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the water issue part of a broader problem affecting a larger water supply system or network?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> publicRelationsOfficer = [
  const Question(
    'Is the issue causing an immediate health risk due to water quality, such as contamination or unsafe drinking water?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many households or businesses are directly impacted by the water issue?',
    [
      'A Few',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Does the issue involve a critical infrastructure, such as a major water treatment plant or water distribution network?',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'Has the issue been persistent and ongoing, causing long-term disruptions to water supply?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the water issue part of a broader problem affecting a larger water supply system or network?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> solidWaste = [
  const Question(
    'Is the issue causing an immediate environmental hazard or posing a threat to public health and safety?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many residents or communities are directly affected by the waste management issue?',
    [
      'A Few',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Does the issue involve the mismanagement of hazardous waste or toxic materials?',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'Is the waste management issue a recurring problem, causing long-term environmental harm or public inconvenience?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the issue generating complaints, legal actions, or regulatory violations that require immediate attention?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> icds = [
  const Question(
    'Does the issue involve an immediate threat to the health, safety, or well-being of children in the program?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many children and families are directly affected by the issue?',
    [
      'A Few',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Is the issue related to a critical service, such as malnutrition management, immunization, or early childhood education?',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'Has the issue been persistent and ongoing, causing long-term disruptions to service delivery?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the issue generating complaints or concerns from parents, caregivers, or the community, requiring immediate attention?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> birthAndDeath = [
  const Question(
    'Is the task related to the registration of a recent or impending death where immediate documentation is required?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many individuals or families are directly affected by the task or responsibility?',
    [
      'One Or a Few',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Does the task involve the registration of a birth or death in a high-risk or emergency situation, such as a home birth or accident?',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'Does the task require coordination with healthcare institutions, law enforcement, or other government agencies?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the task generating urgent requests from families, legal authorities, or other stakeholders that require immediate attention?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> projectAndTownPlanning = [
  const Question(
    'Is the project related to critical infrastructure or services essential for the well-being of the community?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many residents or businesses are directly impacted by the project?',
    [
      'A Few',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Does the project have legal or regulatory deadlines that must be met to avoid penalties or compliance issues?',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'Is the project a part of a larger development plan or a key component of the towns growth and sustainability?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the project generating substantial community interest, feedback, or concerns that require immediate attention?',
    [
      'Yes'
          'No'
    ],
  ),
];

List<Question> accountAndTax = [
  const Question(
    'Is the task related to imminent tax deadlines or obligations that could result in penalties or legal issues if not addressed promptly?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'How many financial transactions or accounts are directly affected by the task or responsibility?',
    [
      'A Few',
      'Several',
      'Many',
    ],
  ),
  const Question(
    'Does the task involve a critical financial decision, such as budgeting, financial reporting, or an audit preparation?',
    [
      'Yes',
      'No',
    ],
  ),
  const Question(
    'Is the task part of a larger financial project or compliance initiative essential for the organizations financial health?',
    [
      'Yes'
          'No'
    ],
  ),
  const Question(
    'Is the task generating concerns, inquiries, or requests from internal or external stakeholders that need immediate attention?',
    [
      'Yes'
          'No'
    ],
  ),
];
