class TextRetriever:
    @staticmethod
    def get_element_text(element):
        print(element)
        # 1. ValuePattern (TextBox, editable fields)
        try:
            if element.Patterns.Value.IsSupported:
                value = element.Patterns.Value.Pattern.Value
                print(value)
                return value.strip()
        except Exception:
            pass

        # 2. TextPattern (some rich text controls)
        try:
            if element.Patterns.Text.IsSupported:
                value = element.Patterns.Text.Pattern.DocumentRange.GetText(-1).strip()
                print(value)
                return value
        except Exception:
            pass

        # 3. Fallback: Name property (TextBlock, Label, metadata fields)
        try:
            value = element.Properties.Name.Value or ""
            print(value)
            return value.strip()
        except Exception:
            return ""

def get_element_text(element):
    """
    Module-level wrapper so Robot Framework can use `Get Element Text` keyword.
    Retrieves text from a UI element using various patterns.
    """
    return TextRetriever.get_element_text(element)