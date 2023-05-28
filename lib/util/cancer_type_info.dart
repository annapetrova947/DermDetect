import 'package:flutter/material.dart';

const highTreatment = 'Высокий риск. Возможно необходимо лечение. Обратитесть к врачу как можно скорее.';
const harmlessNoTreatment = 'Лечение не требуется, однако следует наблюдаться у дерматолога.';
const highTreatmentRecommended = 'Высокий риск. Рекомендуемое лечение. Обратитесь к врачу за консультацией.';
const mediumTreatment = 'Средний риск - необходимо лечение. Обратитесь к врачу за консультацией.';
const harmlessTreatmentPossible = 'Данное новообразование безвредно, однако если оно вам доставляет дискомфорт, обратитеськ врачу.';


@immutable
class CancerTypeEntry {
  const CancerTypeEntry({
    required this.id,
    required this.type,
    required this.shortLabel,
    required this.risk,
    required this.description,
    required this.descriptionShort,
    required this.riskText,
    required this.picture,
    required this.link,
    this.buttonLink,
    this.linkLabel,
  });

  final int id;
  final String type;
  final double risk;
  final String shortLabel;
  final String description;
  final String descriptionShort;
  final String riskText;
  final String picture;
  final String link;
  final String? buttonLink;
  final String? linkLabel;
}

final List<CancerTypeEntry> cTypes = [
  const CancerTypeEntry
    (
      id: 1,
      type: "Меланома",
      shortLabel: "mel",
      risk: 0.9,
      description: 'Злокачественная меланома — это серьезная форма рака кожи, которая начинается в клетках, известных как меланоциты. Хотя данный вид ноовообразования менее распространено, чем базально-клеточная карцинома (BCC) и плоскоклеточная карцинома (SCC) этот рак кожи более опасен из-за его способности быстрее распространяться на другие органы, если не лечить на ранней стадии. Меланома бывает разных форм, размеров и цветов, поэтому ее сложно диагностировать. Меланома обычно излечима при раннем обнаружении и лечении. Как только она распространится глубже на кожу или другие части тела ее становится труднее лечить, и она может быть смертельна.',
      descriptionShort:
      'Malignant melanoma is a serious form of skin cancer that begins in cells known as melanocytes.' +
          'While it is less common than basal cell carcinoma (BCC) and squamous cell carcinoma (SCC),' +
          'this skin cancer is more dangerous because of its ability to spread to other organs more rapidly' +
          'if it is not treated at an early stage.\n\n(Source: skincancer.org)',
      link: "https://www.skincancer.org/skin-cancer-information/melanoma/",
      riskText: highTreatment,
      picture: "assets/images/mel.png"),
  const CancerTypeEntry(
      id: 2,
      type: "Меланоцитарный невус",
      shortLabel: "nv",
      risk: 0.1,
      description: 'Меланоцитарный невус является распространенным доброкачественным поражением кожи, обусловленным местной пролиферацией пигментных клеток (меланоцитов). Коричневый или черный меланоцитарный невус содержит пигмент меланин, поэтому его также можно назвать пигментированной невус. Меланоцитарный невус может присутствовать при рождении или появиться позже. Существуют различные виды врожденных и приобретенных меланоцитарных невусов. Меланоцитарные невусы, которые появляются в детском возрасте (в возрасте от 2 до 10 лет), как правило, являются наиболее заметными и стойкими на протяжении всей жизни. Меланоцитарные невусы, которые приобретаются позже в детстве или во взрослой жизни, часто возникают после воздействия солнца и могут исчезнуть или инволюционировать позже. Хотя точная причина локальной пролиферации невусных клеток неизвестна, ясно, что количество меланоцитарных невусов у человека зависит от генетических факторов, от пребывания на солнце и от иммунного статуса. У людей с большим количеством меланоцитарных невусов, как правило, есть члены семьи, у которых также много подобных поражений. Соматические мутации в генах RAS связаны с врожденным меланоцитарным невусом. Новые меланоцитарные невусы могут появиться после применения препаратов-ингибиторов BRAF (вемурафениб, дабрафениб). ',
      descriptionShort: 'A melanocytic naevus (American spelling \'nevus\'), or mole, is a common benign skin lesion ' +
          'due to a local proliferation of pigment cells (melanocytes). It is sometimes called a ' +
          'naevocytic naevus or just \'naevus\' (but note that there are other types of naevi). ' +
          'A brown or black melanocytic naevus contains the pigment melanin, ' +
          'so may also be called a pigmented naevus.\n\n' +
          'A melanocytic naevus can be present at birth (a congenital melanocytic naevus) or ' +
          'appear later (an acquired naevus). There are various kinds of congenital and ' +
          'acquired melanocytic naevi (American spelling \'nevi\').\n\n(Source: dermnetnz.org)',
      link: "https://dermnetnz.org/topics/melanocytic-naevus",
      riskText: harmlessNoTreatment,
      picture: "assets/images/nv.png"),
  const CancerTypeEntry(
      id: 3,
      type: "Базально-клеточная карцинома",
      shortLabel: "bcc",
      risk: 0.75,
      description: 'Базально-клеточная карцинома является наиболее распространенной формой рака кожи и наиболее часто встречающаяся форма всех видов рака. Базально-клеточная карцинома возникает в результате аномального, неконтролируемого роста базальных клеток. Поскольку базально-клеточная карцинома растет медленно, большинство из них излечимы. Базально-клеточная карцинома может выглядеть как открытые язвы, красные пятна, розовые наросты, блестящие бугорки, шрамы или новообразования со слегка приподнятыми, закругленными краями и/или центральным углублением. Поражения обычно возникают на открытых участках тела. Важно отметить, что базально-клеточная карцинома может выглядеть совершенно по-разному у разных людей. Базально-клеточная карцинома редко распространяются за пределы первоначального очага опухоли. Но эти повреждения могут разрастаться и становиться опасными. Необработанные базально-клеточная карцинома могут стать локально инвазивными, разрастаться вширь и вглубь кожи и разрушать ее. ',
      descriptionShort: 'Basal cell carcinoma (BCC) is the most common form of skin cancer and the most ' +
          'frequently occurring form of all cancers. In the U.S. alone, an estimated 3.6 million ' +
          'cases are diagnosed each year. BCCs arise from abnormal, uncontrolled growth of basa cells.\n' +
          'Because BCCs grow slowly, most are curable and cause minimal damage when caught ' +
          'and treated early. Understanding BCC causes, risk factors and warning signs can help ' +
          'you detect them early, when they are easiest to treat and cure.\n\n(Source: skincancer.org)',
      link:
      "https://www.skincancer.org/skin-cancer-information/basal-cell-carcinoma/",
      riskText: highTreatmentRecommended,
      picture: "assets/images/bcc.png"),
  const CancerTypeEntry(
      id: 4,
      type: "Актинический кератоз",
      shortLabel: "akiec",
      risk: 0.6,
      description: 'Актинический кератоз (АК) является наиболее распространенным предраковым заболеванием, которое образуется на коже, поврежденной хроническим воздействием ультрафиолетовых лучей солнца и/или загара в помещении. Солнечный кератоз - другое название этого заболевания. АК являются результатом длительного воздействия ультрафиолетового излучения. Это означает, что если у вас уже есть АК, у вас, вероятно, в будущем разовьется больше актинических кератозов. Это повышает риск развития рака кожи, поскольку актинический кератоз может развиться в плоскоклеточный рак, распространенную и иногда инвазивную форму заболевания. Актинический кератоз часто проявляются в виде небольших сухих, шелушащихся или покрытых коркой участков кожи. Они могут быть красными, светло- или темно-коричневыми, белыми, розовыми, телесного оттенка или сочетанием цветов, а иногда приподнятыми. Из-за их грубой текстуры актинические кератозы часто легче почувствовать, чем увидеть. Поражения часто возникают на открытых солнцу участках лица, губ, ушей, волосистой части головы, плеч, шеи и тыльной стороны кистей и предплечий. Другая форма актинического кератоза, известная как актинический хейлит, появляется на нижней губе. Несмотря на то, что всего 5-10 процентов актинических кератозов перерастают в рак кожи, подавляющее большинство плоскоклеточных карцином начинаются как актинические кератозы. Вот почему лучше перестраховаться и обратиться к своему дерматологу, если вы считаете, что у вас может быть актинический кератоз.',
      descriptionShort: 'Actinic keratosis (AK) is the most common precancer that forms on skin damaged by chronic ' +
          'exposure to ultraviolet (UV) rays from the sun and/or indoor tanning. ' +
          'Solar keratosis is another name for the condition.\n' +
          'AKs result from long-term exposure to ultraviolet (UV) radiation. ' +
          'This means that if you already have an AK, you are likely to develop more actinic ' +
          'keratoses (plural) in the future. This puts you at a higher risk for skin cancer, ' +
          'since AKs can develop into squamous cell carcinoma (SCC), a common and sometimes invasive form of the disease.\n\n(Source: skincancer.org)',
      link:
      'https://www.skincancer.org/skin-cancer-information/actinic-keratosis/',
      riskText: mediumTreatment,
      picture: "assets/images/akiec.png"),
  const CancerTypeEntry(
      id: 5,
      type: "Доброкачественный кератоз",
      shortLabel: "bkl",
      risk: 0.1,
      description: 'Доброкачественный кератоз - это более широкий термин, который используется для обозначения следующих родственных чешуйчатых поражений кожи: Себорейный кератоз, солнечное лентиго (которое может быть трудно отличить от плоского себорейного кератоза), кератоз, подобный плоскому лишаю (который возникает в результате себорейного кератоза или солнечное лентиго). Себорейный кератоз - это безобидное бородавчатое пятно, которое появляется во взрослом возрасте как распространенный признак старения кожи. У некоторых людей их сотни. Себорейные кератозы чрезвычайно распространены. Было подсчитано, что более 90% взрослых в возрасте старше 60 лет имеют один или несколько из них. Они встречаются у мужчин и женщин всех рас, обычно начинают появляться в 30-40-е годы. Они редко появляются в возрасте до 20 лет. Точная причина себорейных кератозов неизвестна. Себорейные кератозы считаются дегенеративными по своей природе. С течением времени себорейных кератозов становится все больше.',
      descriptionShort:
      'Benign keratosis is a broader term that is used to include the following related scaly skin lesions:\n' +
          'Seborrhoeic keratosis, ' +
          'Solar lentigo (which can be difficult to distinguish from a flat seborrhoeic keratosis), ' +
          'Lichen planus-like keratosis (which arises from a seborrhoeic keratosis or a solar lentigo).\n\n(Source: dermnetnz.org)',
      link: 'https://dermnetnz.org/topics/seborrhoeic-keratosis',
      riskText: harmlessTreatmentPossible,
      picture: "assets/images/bkl.png"),
  const CancerTypeEntry(
      id: 6,
      type: "Дерматофиброма",
      shortLabel: "df",
      risk: 0.1,
      description: 'Дерматофиброма - это распространенный доброкачественный фиброзный узелок, обычно появляющийся на коже голеней. Дерматофиброму также называют кожной фиброзной гистиоцитомой. Дерматофибромы в основном наблюдаются у взрослых. Дерматофибромы могут развиться у людей любой этнической принадлежности. Обычные дерматофибромы чаще встречаются у женщин, чем у мужчин. Очаги поражения состоят из пролиферирующих фибробластов. Также могут быть вовлечены гистиоциты. Иногда их относят к незначительным травмам, включая укусы насекомых, инъекции или ушиб шипом розы, но не всегда. Множественные дерматофибромы могут развиться у пациентов с измененным иммунитетом, таким как ВИЧ, иммуносупрессия или аутоиммунные заболевания.',
      descriptionShort:
      'A dermatofibroma is a common benign fibrous nodule usually found on the skin of the lower legs. ' +
          'A dermatofibroma is also called a cutaneous fibrous histiocytoma. ' +
          'Dermatofibromas are mostly seen in adults. People of every ethnicity can develop dermatofibromas. Ordinary ' +
          'dermatofibromas are more common in women than in men, although some histologic variants are more commonly ' +
          'identified in males.\n\n(Source: dermnetnz.org)',
      link: 'https://dermnetnz.org/topics/dermatofibroma',
      riskText: harmlessTreatmentPossible,
      picture: "assets/images/df.png"),
  const CancerTypeEntry(
      id: 7,
      type: "Сосудистое поражение",
      shortLabel: "vasc",
      risk: 0.1,
      description: 'Сосудистые поражения - это относительно распространенные аномалии кожи и нижележащих тканей, более известные как родимые пятна. Существует три основные категории сосудистых поражений: гемангиомы: сосудистые мальформации и пиогенные гранулемы. Хотя иногда эти родимые пятна могут выглядеть одинаково, каждое из них различается по происхождению и необходимому лечению.',
      descriptionShort:
      'Сосудистые поражения - это относительно распространенные аномалии кожи и нижележащих тканей, более известные как родимые пятна. Существует три основные категории сосудистых поражений: гемангиомы: сосудистые мальформации и пиогенные гранулемы. Хотя иногда эти родимые пятна могут выглядеть одинаково, каждое из них различается по происхождению и необходимому лечению.',
      link:
      'https://www.ssmhealth.com/cardinal-glennon/pediatric-plastic-reconstructive-surgery/hemangiomas',
      riskText: harmlessTreatmentPossible,
      picture: "assets/images/vasc.png"),
  // const CancerTypeEntry(
  //     id: 8,
  //     type: "Плоскоклеточный рак",
  //     shortLabel: "scc",
  //     risk: 0.6,
  //     description: 'Плоскоклеточный рак кожи - распространенная форма рака кожи, которая развивается в плоских клетках, составляющих средний и наружный слои кожи. Плоскоклеточный рак кожи обычно не опасен для жизни, хотя может быть агрессивным. Нелеченный плоскоклеточный рак кожи может увеличиться в размерах или распространиться на другие части вашего тела, вызывая серьезные осложнения. Большинство плоскоклеточных карцином кожи возникает в результате длительного воздействия ультрафиолетового излучения, либо от солнечного света, либо от соляриев и ламп. Избегание ультрафиолетового излучения помогает снизить риск плоскоклеточного рака кожи и других форм рака кожи. Плоскоклеточный рак кожи чаще всего возникает на коже, подверженной воздействию солнца, такой как волосистая часть головы, тыльные стороны ладоней, уши или губы. Но это может произойти на любом участке тела, в том числе во рту, на подошвах ног и на гениталиях. Признаки и симптомы плоскоклеточного рака кожи включают:  Твердый красный узелок, плоская язвочка с чешуйчатой коркой, новая язвочка или приподнятый участок на старом шраме или язве, грубое чешуйчатое пятно на губе, которое может развиться в открытую язву, красную язвочку или шероховатое пятно во рту, красное, выпуклое пятно или бородавкообразная язва на заднем проходе или на ваших гениталиях.',
  //     descriptionShort:
  //     'Squamous cell carcinoma of the skin is a common form of skin cancer that develops in the squamous cells that make up the middle and outer layers of the skin.Squamous cell carcinoma of the skin is usually not life-threatening, though it can be aggressive. Untreated, squamous cell carcinoma of the skin can grow large or spread to other parts of your body, causing serious complications.Most squamous cell carcinomas of the skin result from prolonged exposure to ultraviolet (UV) radiation, either from sunlight or from tanning beds or lamps. Avoiding UV light helps reduce your risk of squamous cell carcinoma of the skin and other forms of skin cancer.\n\n(Source: mayoclinic.org)',
  //     link:
  //     'https://www.mayoclinic.org/diseases-conditions/squamous-cell-carcinoma/symptoms-causes/syc-20352480#',
  //     riskText: mediumTreatment,
  //     picture:"assets/images/scc.jpg",
  // )
  //,
];
