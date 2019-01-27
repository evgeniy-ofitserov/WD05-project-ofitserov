<body class="registration">
	<div class="autorization autorization--vertical-position">
		<div class="autorization-head">
			<div class="autorization-head-logo"><span class="mr-20"><i class="far fa-paper-plane mr-0"></i></span><span>Супер сайт</span></div>

			<?php if ( $uri[0] == 'registration' ){
			?>
				<div class="autorization-head-link"><a class="link" href="login">Вход</a></div>
				
			<?php } else{

			?>

				<div class="autorization-head-link"><a class="link" href="registration">Регистрация</a></div>

			<?php } ?>
		</div>
			<?=$contentReg?>

		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="autorization-footer pb-30">
						<p class="mb-15">© Юрий Ключевский</p>
						<p>Создано с <i class="mr-0 fas fa-heart"></i> в <a class="strong" href="http://webcademy.ru" target="_blank">WebCademy.ru</a> в 2018 году</p>
					</div>
				</div>
			</div>
		</div>
	</div><!-- build:jsLibs js/libs.js -->
	<script src="<?=HOST?>templates/assets/libs/jquery/jquery.min.js"></script><!-- endbuild -->
	<!-- build:jsVendor js/vendor.js -->
	<!-- build:jsMain js/main.js -->
	<!-- <script src="<?=HOST?>templates/assets/js/main.js"></script> -->
	<script src="<?=HOST?>templates/assets/js/input-file.js"></script><!-- endbuild -->
	<script defer="defer" src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</body>

</html>