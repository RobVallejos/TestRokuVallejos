sub init()
    m.context = m.top
    m.border = m.context.findNode("border")
    m.itemPoster = m.context.findNode("itemPoster")
    m.frontFade = m.context.findNode("frontFade")
    m.duration = m.context.findNode("duration")

    m.title = m.context.findNode("title")
    m.subtitle = m.context.findNode("subtitle")
    m.description = m.context.findNode("description")

    m.itemPoster.height = m.context.height
    m.frontFade.uri = "pkg:/images/fade.png"
    m.title.color = "0xFFFFFF"
    m.title.font.size=25
    m.subtitle.color = "0x1F4E5F"
    m.subtitle.font.size=18
    m.description.color = "0xFFFFFF"
    m.description.font.size=16
    m.duration.color = "0xD1D1D1"
    m.duration.font.size=20

    m.context.observeField("focusedChild", "onFocus")    
end sub

sub onContentUpdate()
    content = m.context.content
    m.title.text = content.title
    m.subtitle.text = UCase(content.subtitle)
    m.description.text = content.description
    m.duration.text = content.duration.toStr() + " min"
    m.itemPoster.uri = content.thumb

    m.title.translation = [m.itemPoster.translation[0] + m.itemPoster.width + 15, 10]
    m.subtitle.translation = [m.title.translation[0], m.title.translation[1] + m.title.font.size + 7]
    m.description.translation = [m.subtitle.translation[0], m.subtitle.translation[1] + m.subtitle.font.size + 7]
end sub

sub onFocus()
    if (m.context.hasFocus())
        m.border.color = "0xFF0000"
    else
        m.border.color = "0xFFFFFF"
    end if
end sub

