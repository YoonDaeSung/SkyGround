"use strict";

$.fn.polaroid = function(config) {
    var Polaroid = function () {
        var Polaroid = {
            $src: null,
            config: {
                autoPlay: false,
                duration: 2000,
                slideBackground: 'data:image/png;base64,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',
                rotationRange: {
                    min: -7,
                    max: 7
                },
                shadow: '5px 5px 3px rgba(0,0,0,0.15)',
                borderRadius: '2px'
            },
            slides: [],
            interval: null,
            templates: {
                wrap: '<div class="polaroid-slide"></div>',
                caption: '<div class="polaroid-caption"></div>'
            },
            init: function (config) {
                Polaroid.mergeConfig(config);
                Polaroid.$src.find('img').each(function () {
                    Polaroid.createSlide($(this));
                });
                Polaroid.arrangeSlides();
                Polaroid.applyStyles();
                if (Polaroid.config.autoPlay) {
                    var i = 0;
                    Polaroid.interval = window.setInterval(function () {
                        Polaroid.utility.forward(Polaroid.slides[i]);
                        i++;
                        if (i == Polaroid.slides.length) {
                            i = 0;
                        }
                    }, Polaroid.config.duration);
                }
                if (Polaroid.config.showArrows) {
                    Polaroid.renderArrows();
                } else {
                    Polaroid.animate();
                }

            },
            mergeConfig: function (config) {
                for (var property in config) {
                    if (!Polaroid.config.hasOwnProperty(property)) {
                        throw "Polaroid Exception: Configuration option " + property + " does not exist";
                    }
                    Polaroid.config[property] = config[property];
                }
            },
            arrangeSlides: function () {
                Polaroid.$src.css({
                    "min-height": Polaroid.utility.getMinHeight()
                });
                $(Polaroid.slides).each(function () {
                    this.css({
                        position: 'absolute',
                        left: this.offset().left
                    });
                });
            },
            createSlide: function ($el) {
                var $wrap = $(Polaroid.templates.wrap);
                var $caption = $(Polaroid.templates.caption);
                $el.wrap($wrap);
                $wrap = $el.parent();
                $wrap.append($caption);
                if ($el.data('caption').length > 0) {
                    $caption.append($el.data('caption'));
                }
                Polaroid.slides.push($wrap);
                $wrap.css({
                    width: Polaroid.utility.calculateFrameWidth($el),
                    "padding-top": Polaroid.utility.calculateTopPadding($el)
                });
                $el.css({
                    display: 'block',
                    margin: '0 auto'
                });
                $caption.css({
                    height: Polaroid.utility.calculateCaptionHeight($el)
                });
            },
            applyStyles: function () {
                var i = 1000;
                $(Polaroid.slides).each(function () {
                    var $el = this;
                    var rotation = Polaroid.utility.getRandomInt(
                        Polaroid.config.rotationRange.min,
                        Polaroid.config.rotationRange.max
                    );
                    $el.css({
                        background: 'url(' + Polaroid.config.slideBackground + ') #fff',
                        transform: 'rotate(' + rotation + 'deg)',
                        '-ms-transform': 'rotate(' + rotation + 'deg)',
                        '-webkit-transform': 'rotate(' + rotation + 'deg)',
                        'box-shadow': Polaroid.config.shadow,
                        '-moz-box-shadow': Polaroid.config.shadow,
                        '-webkit-box-shadow': Polaroid.config.shadow,
                        'border-radius': Polaroid.config.borderRadius,
                        'z-index': i--
                    });
                    $el.find('img').css({
                        'box-shadow': 'inset -5px -5px 0 5px rgba(0,0,0,0.15)',
                        '-moz-box-shadow': 'inset -5px -5px 0 5px rgba(0,0,0,0.15)',
                        '-webkit-box-shadow': 'inset -5px -5px 0 5px rgba(0,0,0,0.15)'
                    })
                });
            },
            animate: function () {
                if (!Polaroid.config.showArrows) {
                    $(Polaroid.$src.find('.polaroid-slide')).on('click', function () {
                        if (null != Polaroid.interval) {
                            clearInterval(Polaroid.interval);
                        }
                        Polaroid.utility.forward($(this));
                    });
                }
            },
            renderArrows: function () {
                Polaroid.$src.append()
            },
            utility: {
                calculateFrameWidth: function ($el) {
                    var width = $el.width();
                    return (width + width / 15);
                },
                calculateTopPadding: function ($el) {
                    return $el.height() / 26;
                },
                
                //?????? ?????? ?????? ??? ?????? ??????????????? ??????
                calculateCaptionHeight: function ($el) {
                    return $el.height() / 2.3;
                },
                getMinHeight: function () {
                    var height = 0;
                    $(Polaroid.slides).each(function () {
                        if (this.height() > height) {
                            height = this.height();
                        }
                    });
                    return height;
                },
                getRandomInt: function (min, max) {
                    return Math.floor(Math.random() * (max - min + 1)) + min;
                },
                isAnimationBlocked: function($el) {
                    return $el.data("polaroid-animation-blocked") === true;
                },
                forward: function ($el) {
                    if (!Polaroid.utility.isAnimationBlocked($el)) {
                        $el.data("polaroid-animation-blocked", true);
                        var left = parseFloat($el.css('left'));
                        if (typeof $.fn.velocity == 'function') {
                            $el.velocity({
                                left: left + $el.width() * 1.3
                            }, 300, function () {
                                Polaroid.utility.rebuildZ($el);
                                $el.velocity({
                                    left: left
                                }, 300, function () {
                                    $el.data("polaroid-animation-blocked", false);
                                })
                            });
                        } else {
                            $el.animate({
                                left: left + $el.width() * 1.3
                            }, 300, function () {
                                Polaroid.utility.rebuildZ($el);
                                $el.animate({
                                    left: left
                                }, 300, function () {
                                    $el.data("polaroid-animation-blocked", false);
                                })
                            });
                        }
                    }
                },
                rebuildZ: function ($el) {
                    for (var slide in Polaroid.slides) {
                        $(Polaroid.slides[slide]).css('z-index', '+=1');
                    }
                    $el.css('z-index', '-=' + Polaroid.slides.length);
                }

            }
        };

        return Polaroid;
    };

    return this.each(function () {
        var polaroid = new Polaroid(config);
        polaroid.$src = $(this);
        polaroid.init(config);
    });
}

