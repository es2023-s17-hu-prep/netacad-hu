-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: db
-- Létrehozás ideje: 2023. Jún 13. 13:48
-- Kiszolgáló verziója: 10.10.2-MariaDB-1:10.10.2+maria~ubu2204
-- PHP verzió: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `netacadhu`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `dashboard_elements`
--

CREATE TABLE `dashboard_elements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `dashboard_elements`
--

INSERT INTO `dashboard_elements` (`id`, `title`, `featured_image`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Ut culpa odit eos dolore suscipit.', 'https://via.placeholder.com/640x480.png/00ddaa?text=assumenda', 'Voluptas officia voluptatem eum sunt optio. Sunt tenetur harum consequatur officiis fugit vitae fugiat cupiditate. Quae sed similique perspiciatis. Provident sit dolor voluptas id.', '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(2, 'Blanditiis tenetur nihil rem beatae.', 'https://via.placeholder.com/640x480.png/0000ff?text=omnis', 'Velit doloribus mollitia et repellat. Culpa quis ducimus aut aut. Totam assumenda eius nihil.', '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(3, 'Quo dolorem saepe omnis rem.', 'https://via.placeholder.com/640x480.png/001133?text=eius', 'Ea illo voluptatibus beatae consectetur voluptatum fuga. Dignissimos consequuntur ea ut molestias necessitatibus ea. Nemo placeat ipsam consequatur eos et assumenda.', '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(4, 'Mollitia quia quia quia quos quia ea.', 'https://via.placeholder.com/640x480.png/002266?text=expedita', 'Totam eveniet temporibus sint perferendis non delectus et. Ab sed ducimus laborum aut id cum. Autem sapiente cupiditate atque unde aspernatur aliquam.', '2023-06-13 13:48:33', '2023-06-13 13:48:33');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `menu_items`
--

INSERT INTO `menu_items` (`id`, `title`, `link`, `created_at`, `updated_at`) VALUES
(1, 'Cisco Hálózati Akadémia', '', '2023-06-13 13:48:32', '2023-06-13 13:48:32');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_03_25_134556_create_menu_items_table', 1),
(3, '2023_03_25_134600_create_sub_menu_items_table', 1),
(4, '2023_03_25_134615_create_posts_table', 1),
(5, '2023_03_25_135140_create_slider_elements_table', 1),
(6, '2023_03_25_135144_create_dashboard_elements_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('page','news') NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `headline_long` varchar(255) NOT NULL,
  `headline_short` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `headline_is_not_displaying` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `posts`
--

INSERT INTO `posts` (`id`, `type`, `slug`, `name`, `title`, `subtitle`, `featured_image`, `headline_long`, `headline_short`, `content`, `headline_is_not_displaying`, `created_at`, `updated_at`) VALUES
(1, 'news', 'laboriosam-ut-possimus-pariatur-sunt', 'Ignacio Armstrong', 'Nihil sit enim quasi quia id.', 'Ad id dolorum placeat.', 'https://via.placeholder.com/640x480.png/0066cc?text=unde', 'Fuga eos culpa perspiciatis non explicabo voluptatem. Necessitatibus quia rerum perferendis nostrum suscipit itaque. Accusamus omnis veniam officiis quia similique.', 'Voluptates quam at architecto ratione. Eligendi ipsa autem quam sed repudiandae repudiandae non. Possimus quia ex dicta est. Illo consequuntur ducimus facilis aut vel voluptas.', 'Ut eveniet eveniet accusantium vel autem nesciunt nemo. Unde eveniet molestiae cupiditate minima suscipit sunt magni. Id culpa inventore impedit ipsa quod.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(2, 'page', 'et-eligendi-error-natus', 'Mr. Sylvan Murazik', 'Neque vel ad nesciunt ullam sint.', 'Laudantium aut non hic libero quasi.', 'https://via.placeholder.com/640x480.png/00aadd?text=nemo', 'Sequi dolores omnis tempore totam consectetur. Non corporis modi repellendus aperiam inventore. Adipisci sit quia quaerat et eum. Aliquam natus incidunt quisquam.', 'Veniam est doloremque velit et iusto. Iure quam omnis qui est. Laborum nobis totam possimus ab perferendis.', 'Eaque qui ad molestias sed. Voluptas recusandae animi incidunt ad. Et pariatur totam quaerat ipsam ipsam earum qui. Sed iure optio est asperiores pariatur.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(3, 'news', 'impedit-quos-aut-nesciunt-omnis-quidem', 'Asa Feil', 'Et qui expedita dolor ex unde dolores.', 'Quasi et perferendis exercitationem.', 'https://via.placeholder.com/640x480.png/0022bb?text=sit', 'Et harum illum quidem. Ratione reiciendis sunt aliquid aut repellat autem animi. Quia quia ea culpa in dolore. Excepturi cupiditate et sed nesciunt dolor.', 'Nihil illum dolorem qui voluptate est cupiditate molestias. Aliquam officia est inventore nam qui nisi placeat. Nesciunt molestiae et sed harum temporibus molestiae quaerat. Autem eum non natus beatae quasi.', 'Numquam eligendi vel labore ut. Provident tempora esse et numquam labore vel. Modi sit fugit inventore maiores et quae sint voluptatem.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(4, 'news', 'ipsum-occaecati-voluptatem-animi-voluptas-corporis', 'Randi Casper', 'Qui necessitatibus dolorem tempora eos.', 'Quod facilis iusto impedit ea autem et.', 'https://via.placeholder.com/640x480.png/0088ff?text=impedit', 'Ut quisquam omnis neque velit esse. Et suscipit provident cum est. Officiis sapiente omnis ad. Distinctio facere explicabo iure id labore.', 'Similique quis sint aut eos laborum quos. Libero animi occaecati eligendi odit ipsam. Repudiandae consequatur fugit dolorum dicta rerum. Modi cum inventore repudiandae tenetur aspernatur aut ea. Impedit fuga voluptatibus in vel.', 'Enim fugit id id molestiae. Et consequatur consequatur error dolore id placeat rem porro. Illo voluptates enim ut ut.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(5, 'news', 'minus-praesentium-atque-quis-quam-incidunt-quia-ratione', 'Dr. Nora Ziemann', 'Aut sed pariatur pariatur sunt.', 'Corporis omnis dolores aut eos nemo at.', 'https://via.placeholder.com/640x480.png/0033bb?text=harum', 'Esse vero dolores et et sit ut qui. Corrupti eum est impedit rerum perspiciatis numquam. Officia dolorem molestiae placeat molestiae facilis temporibus.', 'Et voluptates rerum provident molestiae ut atque. Quis voluptatem accusantium eaque et. Minus doloribus et nihil fugiat nihil vel placeat nam. Exercitationem in tempore commodi quia pariatur culpa.', 'Reiciendis distinctio id numquam numquam eum odit magni. Animi et occaecati odio dolorem quis sapiente consequuntur harum. Aperiam aut placeat magni consequatur dolores quae corporis.', 1, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(6, 'news', 'est-rerum-sit-delectus-aperiam-assumenda-quam-et', 'Mr. Vincenzo Tromp', 'Cupiditate autem ratione sunt enim.', 'Cupiditate facere nihil esse culpa.', 'https://via.placeholder.com/640x480.png/009955?text=omnis', 'Tenetur dolore molestias omnis facilis. Tempora officia aut quam recusandae hic. Aut omnis maxime et harum praesentium.', 'Et veritatis soluta similique dicta sint delectus in. Sed molestias tempora iure.', 'Minus ratione aut blanditiis sed. Delectus et pariatur asperiores blanditiis vel in. Consequatur voluptates facere ipsum sed iure. Tempore et eius dicta ipsa porro eum.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(7, 'news', 'est-optio-aut-ab-quia-iste-perspiciatis-vel', 'Marianne Ratke', 'Ipsum harum aut harum et fugiat.', 'Ut voluptates exercitationem eum.', 'https://via.placeholder.com/640x480.png/0044dd?text=in', 'Sint provident incidunt nemo beatae. Reprehenderit dolorum deleniti eligendi.', 'Sed enim molestiae esse ratione quis magnam. Quis at commodi nihil hic officia quia. Id molestias cum totam consequatur voluptas et. Qui officiis sapiente expedita.', 'Incidunt est dolor error iure. Incidunt ad omnis velit minima et iusto. At excepturi illo voluptas itaque ad sequi. Fugiat ullam quisquam nobis.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(8, 'news', 'tempora-quo-sunt-aliquid-voluptatem-fugit', 'Joy Sawayn', 'Enim molestias optio beatae.', 'Ipsa harum quis fugiat est animi.', 'https://via.placeholder.com/640x480.png/00ccff?text=omnis', 'Tempora nam necessitatibus quod voluptatem. Cumque quidem tenetur aperiam facilis ipsa. Quis blanditiis beatae qui ut qui unde. Quibusdam voluptatibus aut non quia. Sed qui sit tenetur possimus ut repudiandae aut.', 'Non maiores commodi eius quia dolorum. Nesciunt consequatur adipisci consequatur qui. Laborum qui alias ipsum vero.', 'Vitae modi hic ex officia ad. Perferendis inventore et aspernatur in est possimus inventore. Natus officiis iure beatae quam et provident. Autem consequuntur accusantium molestiae quo.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(9, 'news', 'ducimus-sit-in-amet-rerum-et', 'Peter Ferry', 'Corrupti quia dolor laudantium quam.', 'Non eum libero possimus ea qui.', 'https://via.placeholder.com/640x480.png/009955?text=in', 'Ullam qui enim dolorem dolorum. Aspernatur maiores ipsum et vero. Asperiores et ut et. Ea nemo itaque quidem nemo voluptas.', 'Provident suscipit placeat fuga omnis harum officia quasi provident. Repudiandae excepturi laborum dolorem veniam facere. Consequatur nihil quo eos provident et. Ad eveniet et illo ut autem aut pariatur excepturi.', 'Iure et in suscipit ut ipsam deserunt facere. Impedit distinctio dicta sint quia. Aut libero et corrupti rerum nesciunt. Error quia eum est illo et. Esse sint animi tempora omnis nihil ipsa et.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(10, 'news', 'harum-maiores-atque-adipisci-inventore-sed-vel-animi', 'Jordane Ebert', 'Omnis ut voluptatem quis inventore sed.', 'Ducimus est sapiente eos.', 'https://via.placeholder.com/640x480.png/00dd77?text=incidunt', 'Porro eaque quia animi cumque. Quas dolor suscipit quia quo animi dolorum tempora. Enim nihil laudantium esse a nesciunt.', 'Veritatis nostrum quod repellendus facilis repudiandae eius repellat explicabo. Cumque sed ratione aut velit.', 'Itaque sunt nesciunt veniam sunt aut sed esse. Necessitatibus consequatur consequatur qui dolor. Consequatur quia sed et incidunt accusantium asperiores impedit.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(11, 'news', 'quis-reiciendis-illo-animi-sit-autem-esse-aut', 'Korbin Herman', 'Voluptas aut rerum sapiente sit.', 'Tempora eligendi totam voluptas.', 'https://via.placeholder.com/640x480.png/0033bb?text=praesentium', 'Voluptate dolor placeat qui facere voluptatem. Optio aut occaecati accusantium accusamus aspernatur natus. Impedit nobis error voluptatem et voluptatem ipsam.', 'Minus doloribus amet est occaecati consequatur ipsum. Et distinctio officiis illum eos unde necessitatibus. Culpa eaque illum commodi provident. Eius et in quae veniam et.', 'Omnis voluptatum sed ut blanditiis quis mollitia. Quas doloribus ut debitis dolorem. Velit magnam vel alias. Sed blanditiis architecto soluta aut.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(12, 'news', 'voluptas-sequi-molestias-quas-qui-deleniti-sed', 'Billy Herman', 'Dolores et ea qui harum qui qui.', 'Sunt labore laboriosam dolor.', 'https://via.placeholder.com/640x480.png/0011aa?text=aut', 'Veniam in consequatur neque quis assumenda explicabo est. Eum dolor voluptatem dolores laudantium quo ipsum officiis quia. Impedit et quia rem nulla numquam nam libero molestias.', 'Similique possimus dicta occaecati occaecati eaque aspernatur. Fuga in natus est voluptatum quas non dolores. Assumenda consectetur dolorum tempora assumenda eos eius sed aliquam. Aut dolorum vel facere omnis voluptas possimus.', 'Enim quia numquam enim quod. Quo dignissimos temporibus quisquam distinctio fugit.', 1, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(13, 'news', 'aut-qui-reiciendis-illo-omnis', 'Agnes Champlin', 'Iste et suscipit autem quae.', 'Ut aspernatur delectus et in.', 'https://via.placeholder.com/640x480.png/00ddff?text=sint', 'Earum quos dolorem minima vel. Distinctio itaque aut beatae voluptate et.', 'Repellat numquam corporis et in odit mollitia repellat. Esse deserunt deleniti necessitatibus voluptas illo vel est. Asperiores animi et quos earum sapiente quos. Corrupti deserunt unde eos sint. Praesentium cum maxime vel dolorem quaerat ut eveniet.', 'Voluptatibus iusto voluptas aspernatur aperiam est natus. Non nam reprehenderit omnis repudiandae. Numquam pariatur numquam quod asperiores. Ea sint blanditiis officiis.', 1, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(14, 'page', 'consequuntur-totam-aliquid-sit-nisi-expedita-ut', 'Dock Shanahan PhD', 'Ipsum unde ipsum ipsam aut ut eveniet.', 'Quas sit distinctio molestias.', 'https://via.placeholder.com/640x480.png/005511?text=earum', 'Voluptate optio molestias qui quia pariatur aut et. Corporis totam ut excepturi recusandae et. Et placeat totam id accusantium ad.', 'Laborum sunt voluptate dolorem eum quia. Qui ipsum et nisi.', 'Illum voluptatem rerum reiciendis voluptatem. Repellendus hic sed velit. Natus aut similique sit repellendus voluptatem neque omnis.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(15, 'news', 'veritatis-et-cumque-error-sunt', 'Michelle Carter PhD', 'Itaque ipsum neque cumque rem.', 'Suscipit vel ut dolores suscipit.', 'https://via.placeholder.com/640x480.png/00ee33?text=distinctio', 'Delectus saepe consequatur eum aperiam reiciendis vero. Ut labore est molestiae rerum debitis.', 'Expedita magni omnis vel natus voluptatibus. Aut aut similique quam velit officia eos possimus dicta. Quia deleniti excepturi nemo perspiciatis voluptas. Quo reiciendis temporibus temporibus est saepe veniam.', 'Ea doloribus pariatur iusto ipsum nihil cumque ut fugit. Excepturi quia aliquid praesentium deserunt. Ut voluptatem impedit corporis.', 1, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(16, 'news', 'eligendi-nisi-iusto-et-at', 'Miss Leonor Watsica V', 'Dolorum dicta voluptatem quia rerum.', 'Est eos facilis in quia et.', 'https://via.placeholder.com/640x480.png/006699?text=et', 'Corrupti et deserunt et facere sed incidunt. Ipsum unde quo aut nulla qui fuga. Exercitationem sapiente et possimus aut expedita nobis natus.', 'Sit ad quo quae consequuntur et sint esse sit. Eos perspiciatis et minus et fuga saepe. Similique voluptatem recusandae eligendi accusamus. Aut aut inventore delectus ut sit dolor quis.', 'Blanditiis minus sit rerum quia magnam qui. Eos harum sint dolorem. At sint iste quae. Aliquid excepturi perspiciatis architecto maxime et ipsum porro.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(17, 'page', 'sunt-nobis-voluptate-ea-odit', 'Sallie Cummings V', 'In et architecto reprehenderit ut.', 'Tempora velit qui quis odit.', 'https://via.placeholder.com/640x480.png/00ee33?text=cupiditate', 'Esse voluptate id rem mollitia adipisci quae qui esse. Ducimus illum consequatur sint excepturi reiciendis temporibus earum. Eos et facilis fuga ut non inventore.', 'Dolores pariatur eligendi aut optio sint est. Eos consequatur reiciendis quo beatae tempora. Reprehenderit corporis ducimus nostrum ullam.', 'Consequatur error natus iusto totam. Similique ipsum deserunt quas eos qui nesciunt maiores. Pariatur odio quo consectetur autem reiciendis expedita vel.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(18, 'page', 'dolorum-ea-maiores-sunt-maxime-illum-inventore-error', 'Gillian Dickens', 'Est dolores at quis temporibus natus.', 'Amet ut aut tenetur.', 'https://via.placeholder.com/640x480.png/008866?text=ut', 'Nemo voluptatibus perferendis et optio dolorem ad. Voluptatem et et dignissimos qui similique. Qui et nihil ex explicabo iste laudantium commodi. Aperiam aperiam et quia.', 'Et aliquam provident deserunt esse rerum deleniti. Qui reprehenderit eos aut perferendis soluta. Quam ipsa eius quis eius sed.', 'Libero veniam iste corrupti nemo itaque voluptatem eos. Totam eveniet quos perferendis ipsum est qui sunt. Et dolorem debitis sint velit sit beatae ratione.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(19, 'page', 'atque-nam-voluptas-in-vero-soluta', 'Clark Bednar', 'Omnis illo earum qui.', 'Culpa quasi qui dolorem nihil maxime.', 'https://via.placeholder.com/640x480.png/009977?text=quas', 'Velit quisquam porro qui quis debitis quo. Temporibus sit reiciendis molestias aut.', 'Animi qui quis dolorem quisquam recusandae dolor omnis. Deserunt facilis ut possimus iusto et saepe. Officiis quia sunt earum qui qui.', 'Laborum magnam doloremque rem eveniet. Iusto deleniti provident voluptatem sed et. Veritatis quae et voluptatibus corporis nobis qui.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(20, 'news', 'aut-tenetur-sapiente-ut-atque-reiciendis', 'Kenya VonRueden', 'Earum consequatur molestiae nihil.', 'Velit quos rerum cum aut quae nostrum.', 'https://via.placeholder.com/640x480.png/00aaaa?text=eos', 'Eum aperiam similique et qui corrupti sint consequuntur. Molestias expedita quod eveniet aut. Pariatur ea voluptatibus commodi. Velit earum sapiente nostrum qui aut ullam. Enim id occaecati ad.', 'Rerum maiores ut velit esse necessitatibus. Nam aut dolor necessitatibus voluptas quam nesciunt a. Et doloremque est modi aut enim.', 'Dolorem tempora sequi id occaecati sit quas. Libero voluptatem molestiae consectetur ratione. Sint unde et praesentium maxime libero et fuga laborum.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(21, 'page', 'fuga-id-soluta-similique-officia-dolore-nihil-minus', 'Lina Wuckert PhD', 'Qui consequuntur ea sed ut.', 'Quod iure et enim tenetur et.', 'https://via.placeholder.com/640x480.png/003333?text=dicta', 'Alias delectus accusantium nihil non. Iure qui unde officiis architecto quia. Beatae accusantium itaque dignissimos ipsum sunt. Esse id et quo dignissimos error sunt omnis in.', 'Et sit aut rem itaque voluptas. Quia rerum repudiandae dicta qui. Occaecati eum omnis quam quos ratione aut. Accusamus est vel nam enim et sit.', 'In quam eos ipsa ut. Rerum quia non deleniti porro rerum. Aliquam veritatis blanditiis laudantium maiores.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(22, 'page', 'laborum-expedita-cupiditate-quia', 'Prof. Shawna Dibbert', 'Aliquid debitis quaerat autem ea.', 'Amet similique error molestiae aut.', 'https://via.placeholder.com/640x480.png/006633?text=distinctio', 'Fugit saepe vel occaecati quo. Tempore delectus adipisci ut voluptatem. Quae quisquam tenetur sit voluptas.', 'Rem unde eum ea incidunt et non. Unde impedit qui aut asperiores quisquam aliquam aspernatur.', 'Reprehenderit dicta atque mollitia qui aut saepe sed debitis. Sunt voluptate dolores enim magni. Minus et et aliquid temporibus. Ad aperiam ea id optio voluptatem.', 1, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(23, 'page', 'ut-reprehenderit-non-voluptatem-ipsum-doloremque', 'Frankie Christiansen', 'Dolores ut reprehenderit eum.', 'Nihil quisquam enim dignissimos quidem.', 'https://via.placeholder.com/640x480.png/00ee55?text=est', 'Dolores earum accusamus non eligendi soluta accusantium nemo soluta. Recusandae tempore quis in ab. Nesciunt deleniti voluptatibus et eaque ratione. Et aut saepe aut porro. Vel enim quia tenetur voluptas.', 'Accusamus facere labore quasi ipsam et sint. Dolores quos velit praesentium quibusdam sint. In in quasi qui iure unde quam qui.', 'Quae sit cumque eum dolores sed. Magni non assumenda qui numquam et excepturi quos. Rerum et voluptatem nisi iure qui veritatis libero quos. Sapiente ab iste aut id et aliquid qui repellat.', 1, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(24, 'news', 'cupiditate-cumque-explicabo-repellat-quia-voluptatem-quaerat-praesentium', 'Mr. Casey Glover I', 'Ut doloribus commodi laborum nihil.', 'Qui consequuntur enim et aut id.', 'https://via.placeholder.com/640x480.png/007755?text=placeat', 'Perferendis ut doloremque quia accusantium unde et. Voluptate repellendus eos ad et et. Quis voluptas vel magnam minus at sit officia.', 'Optio consequatur laudantium quidem sed. Dolorem consequatur officia voluptatem mollitia odit. Animi et vel aut et numquam hic dolorum omnis.', 'Aut at et voluptatibus aliquid reprehenderit error mollitia. Magnam modi minus laudantium odio ratione. Itaque sed officia assumenda perferendis id. Numquam quis expedita qui.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(25, 'page', 'alias-non-et-et-minus', 'Mr. Emmett Goyette', 'Aperiam et nihil rerum aspernatur.', 'Ut quas ea vitae sit corrupti ut sit.', 'https://via.placeholder.com/640x480.png/005599?text=sed', 'Non at magnam totam commodi enim. Voluptatem in error in. Mollitia aliquid cupiditate consectetur sunt. Sint voluptas rem deserunt sequi accusamus quasi voluptatem assumenda.', 'Ullam minus earum aut aut eos accusantium dolor. Dolorum perferendis laboriosam iste id debitis. Et aut minima sit aliquid est. Fugit minus et rerum cupiditate recusandae.', 'Aut mollitia repellat et culpa. Sed maiores voluptatum omnis harum autem et. Animi est deleniti ut corporis ut. Nostrum omnis voluptates dolorum nisi ex et.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(26, 'page', 'doloremque-aut-culpa-cum-iusto-minus', 'Emilie Graham', 'Odit ratione enim esse aut.', 'Ab dolore nobis iste quaerat iure.', 'https://via.placeholder.com/640x480.png/00ff88?text=provident', 'Praesentium vel architecto eum magnam quo. Exercitationem ut a necessitatibus minima modi. Possimus est dolore quas ipsam nihil.', 'Nihil perspiciatis nulla odit. Optio illum fuga magnam unde dolore id. Dolores sint beatae enim quo quos sit. Dicta voluptatem eaque nihil et autem beatae.', 'Sed dolorem soluta aliquam. Temporibus in voluptatum excepturi voluptatum nostrum est id. Et sit quia reiciendis accusamus dignissimos saepe dolores.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(27, 'page', 'perspiciatis-facilis-asperiores-labore-voluptatem-eos', 'Ms. Sonia Jacobs III', 'Quos nihil quis culpa aut.', 'Ut et necessitatibus distinctio atque.', 'https://via.placeholder.com/640x480.png/00dd33?text=voluptas', 'Nihil voluptatem ipsa suscipit illum eveniet eveniet nulla. Eum similique fugit totam ut in. Necessitatibus vitae provident illo veniam doloremque fuga.', 'Dolor est neque asperiores ad eius quod veniam. Velit magnam consequatur maxime. Eum amet omnis adipisci excepturi est voluptatem.', 'Dignissimos eum temporibus nam rerum maiores autem porro. Rerum aliquam totam enim veniam tempore. Voluptas sunt tempora maxime nihil et molestiae sunt.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(28, 'page', 'tenetur-quos-error-quaerat-ea', 'Britney Kulas III', 'Mollitia veniam molestias enim quam.', 'Illo omnis optio incidunt nam.', 'https://via.placeholder.com/640x480.png/002200?text=porro', 'Dolores laudantium cupiditate sint labore. Qui enim similique aut adipisci sequi veniam culpa. Provident omnis et minima fuga dolor voluptas dolores. Omnis tenetur mollitia molestias officiis dicta deleniti.', 'Eum recusandae quis nisi optio consequatur hic. Porro eum quidem repudiandae nesciunt. Tempore similique exercitationem ullam hic voluptate et nesciunt.', 'Velit commodi rem voluptate et officiis est illo. Inventore vitae quisquam vitae aut sit. Officiis ex dolores veritatis ex deleniti quos saepe.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(29, 'page', 'cupiditate-necessitatibus-mollitia-eum-in-officia-voluptas-perferendis-consequatur', 'Hannah Moore', 'Omnis quos deserunt ipsam mollitia.', 'Eaque qui ea illum et quidem.', 'https://via.placeholder.com/640x480.png/00aaaa?text=dolores', 'Dignissimos molestias qui suscipit soluta. Molestias totam consequatur quo accusantium quia dolorum.', 'Fugiat nulla laborum nihil tempora et ducimus. Nemo omnis modi nobis reiciendis tenetur incidunt nemo. Labore corrupti ipsum impedit dolor magnam aperiam. Ut dolor corrupti et non. Unde officiis amet nulla eligendi molestiae quis eos voluptas.', 'Aspernatur illum deleniti aspernatur eius et eaque. Labore sunt nam officiis qui. Sit quo sunt ea quis nobis unde. Sed officiis facilis dolorem nam iure culpa.', 1, '2023-06-13 13:48:33', '2023-06-13 13:48:33'),
(30, 'page', 'illum-quisquam-minus-omnis-autem-nihil-reprehenderit-voluptas', 'Sydnee Kertzmann', 'Quia est architecto nesciunt sit minus.', 'Labore adipisci maiores enim.', 'https://via.placeholder.com/640x480.png/0033dd?text=qui', 'Eos aut inventore laborum ut quae accusantium voluptatem corrupti. Ad qui voluptate consequuntur provident quaerat cumque autem. Aperiam nihil eaque culpa aspernatur atque non.', 'Maiores impedit repellat porro quas sunt repudiandae est. Sint asperiores vel mollitia aut quod.', 'Sint nulla modi sit labore veritatis consectetur laboriosam illo. Soluta nesciunt qui et. Aliquid aperiam voluptatem eos nulla eligendi sint.', 0, '2023-06-13 13:48:33', '2023-06-13 13:48:33');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `slider_elements`
--

CREATE TABLE `slider_elements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `featured_image` varchar(255) NOT NULL,
  `is_featured_image_left` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `slider_elements`
--

INSERT INTO `slider_elements` (`id`, `title`, `featured_image`, `is_featured_image_left`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Et hic ut similique.', 'https://via.placeholder.com/640x480.png/00cc88?text=assumenda', 0, 'Et qui qui et culpa debitis non. Fuga animi distinctio sit quasi ut sed.', '2023-06-13 13:48:32', '2023-06-13 13:48:32'),
(2, 'Vel repellat nesciunt a earum.', 'https://via.placeholder.com/640x480.png/00aa00?text=incidunt', 0, 'Et consequatur eaque eum voluptas. Ut unde enim qui eaque alias minima. Fugiat optio molestiae earum nostrum accusamus et aliquid.', '2023-06-13 13:48:32', '2023-06-13 13:48:32'),
(3, 'Odio aliquam in id error dolorem.', 'https://via.placeholder.com/640x480.png/00aaee?text=ipsum', 1, 'Iusto non facere consectetur aut est nemo ut. Libero nam consequuntur non natus a natus doloribus sed. Sit animi placeat et et voluptas.', '2023-06-13 13:48:32', '2023-06-13 13:48:32'),
(4, 'Quo facilis eos nobis voluptatem.', 'https://via.placeholder.com/640x480.png/008866?text=doloremque', 0, 'Nulla in natus suscipit cumque quia fugiat. Dolorem et ex sit et itaque. Quis mollitia quis cumque eius architecto.', '2023-06-13 13:48:32', '2023-06-13 13:48:32'),
(5, 'Quo ratione aut quo quo minima.', 'https://via.placeholder.com/640x480.png/0077dd?text=quis', 1, 'In non repellendus qui sint non. Quia quas odit quia. Ipsum quos non quis dolores. Vel atque nostrum quo quisquam.', '2023-06-13 13:48:32', '2023-06-13 13:48:32');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sub_menu_items`
--

CREATE TABLE `sub_menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sub_menu_items`
--

INSERT INTO `sub_menu_items` (`id`, `title`, `link`, `menu_item_id`, `created_at`, `updated_at`) VALUES
(1, 'Bemutatkozik a Cisco Hálózati Akadémia', '/netacad/bemutatkozas', 1, '2023-06-13 13:48:32', '2023-06-13 13:48:32');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `dashboard_elements`
--
ALTER TABLE `dashboard_elements`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `slider_elements`
--
ALTER TABLE `slider_elements`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `sub_menu_items`
--
ALTER TABLE `sub_menu_items`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `dashboard_elements`
--
ALTER TABLE `dashboard_elements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `slider_elements`
--
ALTER TABLE `slider_elements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `sub_menu_items`
--
ALTER TABLE `sub_menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
